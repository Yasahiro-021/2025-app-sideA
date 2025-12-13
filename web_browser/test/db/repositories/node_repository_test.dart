import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_browser/db/models/node_model.dart';
import 'package:web_browser/db/database_helper.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node.dart';

/// テスト用のリポジトリクラス
/// 
/// インメモリデータベースを使用してテストを行う
class TestNodeRepository {
  final Database db;

  TestNodeRepository(this.db);

  /// 単一ノードを保存
  Future<void> saveNode(int treeId, NodePath path, BrowserNode node) async {
    final nodeModel = NodeModel(
      treeId: treeId,
      path: path.toString(),
      title: node.title,
      url: node.url,
      date: node.date,
    );
    await db.insert(
      DatabaseHelper.tableNodes,
      nodeModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 複数ノードを一括保存
  Future<void> saveNodes(int treeId, Map<NodePath, BrowserNode> nodes) async {
    final batch = db.batch();
    for (final entry in nodes.entries) {
      final nodeModel = NodeModel(
        treeId: treeId,
        path: entry.key.toString(),
        title: entry.value.title,
        url: entry.value.url,
        date: entry.value.date,
      );
      batch.insert(
        DatabaseHelper.tableNodes,
        nodeModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  /// パスでノードを取得
  Future<BrowserNode?> getNodeByPath(int treeId, NodePath path) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, path.toString()],
    );
    if (maps.isEmpty) return null;
    final model = NodeModel.fromMap(maps.first);
    return BrowserNode(
      title: model.title,
      url: model.url,
      date: model.date,
    );
  }

  /// 指定ツリーの全ノードをMap形式で取得
  Future<Map<NodePath, BrowserNode>> getAllNodes(int treeId) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
    final result = <NodePath, BrowserNode>{};
    for (final map in maps) {
      final model = NodeModel.fromMap(map);
      final path = NodePath.fromString(model.path);
      result[path] = BrowserNode(
        title: model.title,
        url: model.url,
        date: model.date,
      );
    }
    return result;
  }

  /// ルートノードを取得
  Future<BrowserNode?> getRootNode(int treeId) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, '/'],
    );
    if (maps.isEmpty) return null;
    final model = NodeModel.fromMap(maps.first);
    return BrowserNode(
      title: model.title,
      url: model.url,
      date: model.date,
    );
  }

  /// 指定パスの直接の子ノードのパスリストを取得
  Future<List<NodePath>> getChildrenPaths(int treeId, NodePath parentPath) async {
    final allMaps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
    final parentPathStr = parentPath.toString();
    String pattern;
    if (parentPathStr == '/') {
      pattern = r'^/[0-9]+$';
    } else {
      pattern = '^${RegExp.escape(parentPathStr)}/[0-9]+\$';
    }
    final regex = RegExp(pattern);
    return allMaps
        .where((map) => regex.hasMatch(map['path'] as String))
        .map((map) => NodePath.fromString(map['path'] as String))
        .toList();
  }

  /// ノードを更新
  Future<void> updateNode(int treeId, NodePath path, BrowserNode node) async {
    final nodeModel = NodeModel(
      treeId: treeId,
      path: path.toString(),
      title: node.title,
      url: node.url,
      date: node.date,
    );
    await db.update(
      DatabaseHelper.tableNodes,
      nodeModel.toMap(),
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, path.toString()],
    );
  }

  /// パスでノードを削除
  Future<void> deleteNode(int treeId, NodePath path) async {
    await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, path.toString()],
    );
  }

  /// パスでノードとその子孫を全て削除
  Future<void> deleteNodeWithDescendants(int treeId, NodePath path) async {
    final pathStr = path.toString();
    if (pathStr == '/') {
      await db.delete(
        DatabaseHelper.tableNodes,
        where: 'tree_id = ?',
        whereArgs: [treeId],
      );
    } else {
      await db.delete(
        DatabaseHelper.tableNodes,
        where: 'tree_id = ? AND (path = ? OR path LIKE ?)',
        whereArgs: [treeId, pathStr, '$pathStr/%'],
      );
    }
  }

  /// 指定ツリーの全データを削除
  Future<void> clearAllByTreeId(int treeId) async {
    await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
  }

  /// 全データを削除
  Future<void> clearAll() async {
    await db.delete(DatabaseHelper.tableNodes);
  }
}

void main() {
  // FFIを使用してテスト環境でSQLiteを動作させる
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late TestNodeRepository repository;
  const int defaultTreeId = 1;

  setUp(() async {
    // インメモリデータベースを作成
    db = await openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: (db, version) async {
        // treesテーブル
        await db.execute('''
          CREATE TABLE ${DatabaseHelper.tableTrees} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE,
            created_at TEXT,
            updated_at TEXT
          )
        ''');
        // nodesテーブル
        await db.execute('''
          CREATE TABLE ${DatabaseHelper.tableNodes} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tree_id INTEGER NOT NULL,
            path TEXT NOT NULL,
            title TEXT NOT NULL,
            url TEXT NOT NULL,
            date TEXT,
            FOREIGN KEY (tree_id) REFERENCES ${DatabaseHelper.tableTrees} (id) ON DELETE CASCADE,
            UNIQUE (tree_id, path)
          )
        ''');
        await db.execute('CREATE INDEX idx_nodes_tree_path ON ${DatabaseHelper.tableNodes} (tree_id, path)');
        // デフォルトツリーを作成
        await db.insert(DatabaseHelper.tableTrees, {'id': 1, 'name': 'Default'});
      },
    );
    repository = TestNodeRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('NodeRepository', () {
    test('単一ノードを保存・取得できること', () async {
      final path = NodePath.root;
      final node = BrowserNode(title: 'ルート', url: 'https://root.com');

      await repository.saveNode(defaultTreeId, path, node);
      final loaded = await repository.getNodeByPath(defaultTreeId, path);

      expect(loaded, isNotNull);
      expect(loaded!.title, 'ルート');
      expect(loaded.url, 'https://root.com');
    });

    test('深い階層のノードを保存・取得できること', () async {
      final path = NodePath(path: [0, 1, 2]);
      final node = BrowserNode(title: '深いノード', url: 'https://deep.com', date: '2025-12-11');

      await repository.saveNode(defaultTreeId, path, node);
      final loaded = await repository.getNodeByPath(defaultTreeId, path);

      expect(loaded, isNotNull);
      expect(loaded!.title, '深いノード');
      expect(loaded.date, '2025-12-11');
    });

    test('複数ノードを一括保存・取得できること', () async {
      final nodes = <NodePath, BrowserNode>{
        NodePath.root: BrowserNode(title: 'ルート', url: 'https://root.com'),
        NodePath(path: [0]): BrowserNode(title: '子1', url: 'https://child1.com'),
        NodePath(path: [1]): BrowserNode(title: '子2', url: 'https://child2.com'),
      };

      await repository.saveNodes(defaultTreeId, nodes);
      final allNodes = await repository.getAllNodes(defaultTreeId);

      expect(allNodes.length, 3);
      expect(allNodes[NodePath.root]!.title, 'ルート');
      expect(allNodes[NodePath(path: [0])]!.title, '子1');
    });

    test('ルートノードを取得できること', () async {
      await repository.saveNode(defaultTreeId, NodePath.root, BrowserNode(title: 'ルート', url: 'https://root.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0]), BrowserNode(title: '子', url: 'https://child.com'));

      final root = await repository.getRootNode(defaultTreeId);

      expect(root, isNotNull);
      expect(root!.title, 'ルート');
    });

    test('子ノードのパスリストを取得できること', () async {
      await repository.saveNode(defaultTreeId, NodePath.root, BrowserNode(title: 'ルート', url: 'https://root.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0]), BrowserNode(title: '子1', url: 'https://c1.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [1]), BrowserNode(title: '子2', url: 'https://c2.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0, 0]), BrowserNode(title: '孫', url: 'https://gc.com'));

      final childPaths = await repository.getChildrenPaths(defaultTreeId, NodePath.root);

      expect(childPaths.length, 2);
      expect(childPaths.map((p) => p.toString()).toList(), containsAll(['/0', '/1']));
    });

    test('深い階層の子ノードパスを取得できること', () async {
      await repository.saveNode(defaultTreeId, NodePath(path: [0]), BrowserNode(title: '子', url: 'https://c.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0, 0]), BrowserNode(title: '孫1', url: 'https://gc1.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0, 1]), BrowserNode(title: '孫2', url: 'https://gc2.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0, 0, 0]), BrowserNode(title: 'ひ孫', url: 'https://ggc.com'));

      final childPaths = await repository.getChildrenPaths(defaultTreeId, NodePath(path: [0]));

      expect(childPaths.length, 2);
      expect(childPaths.map((p) => p.toString()).toList(), containsAll(['/0/0', '/0/1']));
    });

    test('ノードを更新できること', () async {
      final path = NodePath(path: [0]);
      await repository.saveNode(defaultTreeId, path, BrowserNode(title: '更新前', url: 'https://before.com'));

      await repository.updateNode(defaultTreeId, path, BrowserNode(title: '更新後', url: 'https://after.com'));
      final loaded = await repository.getNodeByPath(defaultTreeId, path);

      expect(loaded!.title, '更新後');
      expect(loaded.url, 'https://after.com');
    });

    test('ノードを削除できること', () async {
      final path = NodePath(path: [0]);
      await repository.saveNode(defaultTreeId, path, BrowserNode(title: 'テスト', url: 'https://test.com'));

      await repository.deleteNode(defaultTreeId, path);
      final loaded = await repository.getNodeByPath(defaultTreeId, path);

      expect(loaded, isNull);
    });

    test('ノードとその子孫を全て削除できること', () async {
      await repository.saveNode(defaultTreeId, NodePath(path: [0]), BrowserNode(title: '親', url: 'https://p.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0, 0]), BrowserNode(title: '子', url: 'https://c.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0, 0, 0]), BrowserNode(title: '孫', url: 'https://gc.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [1]), BrowserNode(title: '別', url: 'https://other.com'));

      await repository.deleteNodeWithDescendants(defaultTreeId, NodePath(path: [0]));
      final allNodes = await repository.getAllNodes(defaultTreeId);

      expect(allNodes.length, 1);
      expect(allNodes.keys.first.toString(), '/1');
    });

    test('データがない場合はnullが返ること', () async {
      final loaded = await repository.getNodeByPath(defaultTreeId, NodePath.root);

      expect(loaded, isNull);
    });

    test('clearAllByTreeIdで指定ツリーの全データが削除されること', () async {
      await repository.saveNode(defaultTreeId, NodePath.root, BrowserNode(title: 'ルート', url: 'https://root.com'));
      await repository.saveNode(defaultTreeId, NodePath(path: [0]), BrowserNode(title: '子', url: 'https://child.com'));

      await repository.clearAllByTreeId(defaultTreeId);
      final allNodes = await repository.getAllNodes(defaultTreeId);

      expect(allNodes.isEmpty, isTrue);
    });

    test('上書き保存ができること', () async {
      final path = NodePath(path: [0]);
      await repository.saveNode(defaultTreeId, path, BrowserNode(title: '初回', url: 'https://first.com'));
      await repository.saveNode(defaultTreeId, path, BrowserNode(title: '上書き', url: 'https://second.com'));

      final loaded = await repository.getNodeByPath(defaultTreeId, path);

      expect(loaded!.title, '上書き');
      expect(loaded.url, 'https://second.com');
    });

    test('複雑なツリー構造を保存・取得できること', () async {
      // ルート -> /0 -> /0/0
      //              -> /0/1
      //       -> /1 -> /1/0 -> /1/0/0
      final nodes = <NodePath, BrowserNode>{
        NodePath.root: BrowserNode(title: 'ルート', url: 'https://root.com'),
        NodePath(path: [0]): BrowserNode(title: '子1', url: 'https://c1.com'),
        NodePath(path: [1]): BrowserNode(title: '子2', url: 'https://c2.com'),
        NodePath(path: [0, 0]): BrowserNode(title: '孫1-1', url: 'https://gc11.com'),
        NodePath(path: [0, 1]): BrowserNode(title: '孫1-2', url: 'https://gc12.com'),
        NodePath(path: [1, 0]): BrowserNode(title: '孫2-1', url: 'https://gc21.com'),
        NodePath(path: [1, 0, 0]): BrowserNode(title: 'ひ孫2-1-1', url: 'https://ggc211.com'),
      };

      await repository.saveNodes(defaultTreeId, nodes);
      final allNodes = await repository.getAllNodes(defaultTreeId);

      expect(allNodes.length, 7);

      // 子ノードの確認
      final rootChildren = await repository.getChildrenPaths(defaultTreeId, NodePath.root);
      expect(rootChildren.length, 2);

      // 孫ノードの確認
      final child1Children = await repository.getChildrenPaths(defaultTreeId, NodePath(path: [0]));
      expect(child1Children.length, 2);

      // ひ孫ノードの確認
      final gc21Children = await repository.getChildrenPaths(defaultTreeId, NodePath(path: [1, 0]));
      expect(gc21Children.length, 1);
      expect(gc21Children.first.toString(), '/1/0/0');
    });

    test('異なるツリーに同じパスのノードを保存できること', () async {
      // ツリー2を作成
      await db.insert(DatabaseHelper.tableTrees, {'id': 2, 'name': 'Tree2'});
      
      await repository.saveNode(1, NodePath.root, BrowserNode(title: 'ツリー1ルート', url: 'https://tree1.com'));
      await repository.saveNode(2, NodePath.root, BrowserNode(title: 'ツリー2ルート', url: 'https://tree2.com'));

      final tree1Root = await repository.getNodeByPath(1, NodePath.root);
      final tree2Root = await repository.getNodeByPath(2, NodePath.root);

      expect(tree1Root!.title, 'ツリー1ルート');
      expect(tree2Root!.title, 'ツリー2ルート');
    });

    test('ツリー別にノードを取得できること', () async {
      // ツリー2を作成
      await db.insert(DatabaseHelper.tableTrees, {'id': 2, 'name': 'Tree2'});
      
      await repository.saveNode(1, NodePath(path: [0]), BrowserNode(title: 'ツリー1子', url: 'https://tree1.com'));
      await repository.saveNode(2, NodePath(path: [0]), BrowserNode(title: 'ツリー2子', url: 'https://tree2.com'));
      await repository.saveNode(2, NodePath(path: [1]), BrowserNode(title: 'ツリー2子2', url: 'https://tree2-2.com'));

      final tree1Nodes = await repository.getAllNodes(1);
      final tree2Nodes = await repository.getAllNodes(2);

      expect(tree1Nodes.length, 1);
      expect(tree2Nodes.length, 2);
    });
  });
}
