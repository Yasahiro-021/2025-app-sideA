import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_browser/db/models/node_model.dart';
import 'package:web_browser/db/database_helper.dart';

/// テスト用のインメモリデータベースを使用するNodeDao
/// 
/// 本番のDatabaseHelperはファイルベースのDBを使用するため、
/// テストでは直接インメモリDBを操作する
class TestNodeDao {
  final Database db;

  TestNodeDao(this.db);

  Future<int> insert(NodeModel node) async {
    return await db.insert(
      DatabaseHelper.tableNodes,
      node.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAll(List<NodeModel> nodes) async {
    final batch = db.batch();
    for (final node in nodes) {
      batch.insert(
        DatabaseHelper.tableNodes,
        node.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<NodeModel?> getById(int id) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return NodeModel.fromMap(maps.first);
  }

  Future<NodeModel?> getByPath(int treeId, String path) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, path],
    );
    if (maps.isEmpty) return null;
    return NodeModel.fromMap(maps.first);
  }

  Future<List<NodeModel>> getAllByTreeId(int treeId) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  Future<List<NodeModel>> getAll() async {
    final maps = await db.query(DatabaseHelper.tableNodes);
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  Future<NodeModel?> getRootNode(int treeId) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, '/'],
    );
    if (maps.isEmpty) return null;
    return NodeModel.fromMap(maps.first);
  }

  Future<List<NodeModel>> getChildrenByParentPath(int treeId, String parentPath) async {
    final allMaps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
    String pattern;
    if (parentPath == '/') {
      pattern = r'^/[0-9]+$';
    } else {
      pattern = '^${RegExp.escape(parentPath)}/[0-9]+\$';
    }
    final regex = RegExp(pattern);
    return allMaps
        .where((map) => regex.hasMatch(map['path'] as String))
        .map((map) => NodeModel.fromMap(map))
        .toList();
  }

  Future<List<NodeModel>> getDescendantsByPath(int treeId, String parentPath) async {
    String likePattern;
    if (parentPath == '/') {
      likePattern = '/%';
    } else {
      likePattern = '$parentPath/%';
    }
    
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path LIKE ?',
      whereArgs: [treeId, likePattern],
    );
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  Future<int> update(NodeModel node) async {
    if (node.id == null) {
      throw ArgumentError('更新するノードにはIDが必要です');
    }
    return await db.update(
      DatabaseHelper.tableNodes,
      node.toMap(),
      where: 'id = ?',
      whereArgs: [node.id],
    );
  }

  Future<int> updateByPath(int treeId, NodeModel node) async {
    return await db.update(
      DatabaseHelper.tableNodes,
      node.toMap(),
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, node.path],
    );
  }

  Future<int> delete(int id) async {
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteByPath(int treeId, String path) async {
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, path],
    );
  }

  Future<int> deleteWithDescendants(int treeId, String path) async {
    if (path == '/') {
      return await db.delete(
        DatabaseHelper.tableNodes,
        where: 'tree_id = ?',
        whereArgs: [treeId],
      );
    }
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND (path = ? OR path LIKE ?)',
      whereArgs: [treeId, path, '$path/%'],
    );
  }

  Future<int> deleteAllByTreeId(int treeId) async {
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
  }

  Future<int> deleteAll() async {
    return await db.delete(DatabaseHelper.tableNodes);
  }
}

void main() {
  // FFIを使用してテスト環境でSQLiteを動作させる
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late TestNodeDao dao;
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
    dao = TestNodeDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('NodeDao', () {
    test('ノードを挿入できること', () async {
      final node = NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com');
      final id = await dao.insert(node);

      expect(id, greaterThan(0));
    });

    test('挿入したノードをIDで取得できること', () async {
      final node = NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com');
      final id = await dao.insert(node);

      final retrieved = await dao.getById(id);

      expect(retrieved, isNotNull);
      expect(retrieved!.id, id);
      expect(retrieved.treeId, defaultTreeId);
      expect(retrieved.path, '/');
      expect(retrieved.title, 'ルート');
    });

    test('挿入したノードをツリーIDとパスで取得できること', () async {
      final node = NodeModel(treeId: defaultTreeId, path: '/0/1', title: 'テスト', url: 'https://test.com');
      await dao.insert(node);

      final retrieved = await dao.getByPath(defaultTreeId, '/0/1');

      expect(retrieved, isNotNull);
      expect(retrieved!.path, '/0/1');
      expect(retrieved.title, 'テスト');
    });

    test('存在しないIDで取得するとnullが返ること', () async {
      final retrieved = await dao.getById(999);

      expect(retrieved, isNull);
    });

    test('存在しないパスで取得するとnullが返ること', () async {
      final retrieved = await dao.getByPath(defaultTreeId, '/nonexistent');

      expect(retrieved, isNull);
    });

    test('複数のノードを一括挿入できること', () async {
      final nodes = [
        NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com'),
        NodeModel(treeId: defaultTreeId, path: '/0', title: '子1', url: 'https://child1.com'),
        NodeModel(treeId: defaultTreeId, path: '/1', title: '子2', url: 'https://child2.com'),
      ];

      await dao.insertAll(nodes);
      final all = await dao.getAllByTreeId(defaultTreeId);

      expect(all.length, 3);
    });

    test('指定ツリーの全ノードを取得できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '子', url: 'https://child.com'));

      final all = await dao.getAllByTreeId(defaultTreeId);

      expect(all.length, 2);
    });

    test('ルートノードを取得できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '子', url: 'https://child.com'));

      final root = await dao.getRootNode(defaultTreeId);

      expect(root, isNotNull);
      expect(root!.path, '/');
      expect(root.title, 'ルート');
    });

    test('指定パスの直接の子ノードを取得できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '子1', url: 'https://child1.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/1', title: '子2', url: 'https://child2.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0', title: '孫', url: 'https://grandchild.com'));

      final children = await dao.getChildrenByParentPath(defaultTreeId, '/');

      expect(children.length, 2);
      expect(children.map((n) => n.path).toList(), containsAll(['/0', '/1']));
    });

    test('深い階層の子ノードを取得できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '子', url: 'https://child.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0', title: '孫1', url: 'https://gc1.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/1', title: '孫2', url: 'https://gc2.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0/0', title: 'ひ孫', url: 'https://ggc.com'));

      final children = await dao.getChildrenByParentPath(defaultTreeId, '/0');

      expect(children.length, 2);
      expect(children.map((n) => n.path).toList(), containsAll(['/0/0', '/0/1']));
    });

    test('子孫ノードを全て取得できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '子', url: 'https://child.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0', title: '孫', url: 'https://gc.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0/0', title: 'ひ孫', url: 'https://ggc.com'));

      final descendants = await dao.getDescendantsByPath(defaultTreeId, '/0');

      expect(descendants.length, 2);
      expect(descendants.map((n) => n.path).toList(), containsAll(['/0/0', '/0/0/0']));
    });

    test('ノードを更新できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: '更新前', url: 'https://before.com'));

      await dao.updateByPath(defaultTreeId, NodeModel(treeId: defaultTreeId, path: '/', title: '更新後', url: 'https://after.com'));
      final retrieved = await dao.getByPath(defaultTreeId, '/');

      expect(retrieved!.title, '更新後');
    });

    test('ツリーIDとパスでノードを更新できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '更新前', url: 'https://before.com'));

      await dao.updateByPath(defaultTreeId, NodeModel(treeId: defaultTreeId, path: '/0', title: '更新後', url: 'https://after.com'));
      final retrieved = await dao.getByPath(defaultTreeId, '/0');

      expect(retrieved!.title, '更新後');
      expect(retrieved.url, 'https://after.com');
    });

    test('IDがnullのノードを更新しようとするとエラーになること', () async {
      final node = NodeModel(treeId: defaultTreeId, path: '/', title: 'テスト', url: 'https://test.com');

      expect(() => dao.update(node), throwsArgumentError);
    });

    test('ノードを削除できること', () async {
      final id = await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: 'テスト', url: 'https://test.com'));

      await dao.delete(id);
      final retrieved = await dao.getById(id);

      expect(retrieved, isNull);
    });

    test('ツリーIDとパスでノードを削除できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: 'テスト', url: 'https://test.com'));

      await dao.deleteByPath(defaultTreeId, '/0');
      final retrieved = await dao.getByPath(defaultTreeId, '/0');

      expect(retrieved, isNull);
    });

    test('ノードと子孫を全て削除できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '親', url: 'https://parent.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0', title: '子', url: 'https://child.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0/0', title: '孫', url: 'https://gc.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/1', title: '別の子', url: 'https://other.com'));

      await dao.deleteWithDescendants(defaultTreeId, '/0');
      final all = await dao.getAllByTreeId(defaultTreeId);

      expect(all.length, 1);
      expect(all.first.path, '/1');
    });

    test('指定ツリーの全ノードを削除できること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '子', url: 'https://child.com'));

      await dao.deleteAllByTreeId(defaultTreeId);
      final all = await dao.getAllByTreeId(defaultTreeId);

      expect(all.length, 0);
    });

    test('同じツリー内で同じパスで上書きできること', () async {
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '初回', url: 'https://first.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '上書き', url: 'https://second.com'));

      final retrieved = await dao.getByPath(defaultTreeId, '/0');

      expect(retrieved!.title, '上書き');
      expect(retrieved.url, 'https://second.com');
    });

    test('階層構造を持つノードを保存・取得できること', () async {
      // ルート -> 子1 -> 孫1
      //       -> 子2
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/', title: 'ルート', url: 'https://root.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0', title: '子1', url: 'https://child1.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/1', title: '子2', url: 'https://child2.com'));
      await dao.insert(NodeModel(treeId: defaultTreeId, path: '/0/0', title: '孫1', url: 'https://gc1.com'));

      final all = await dao.getAllByTreeId(defaultTreeId);
      final root = await dao.getRootNode(defaultTreeId);
      final children = await dao.getChildrenByParentPath(defaultTreeId, '/');
      final grandchildren = await dao.getChildrenByParentPath(defaultTreeId, '/0');

      expect(all.length, 4);
      expect(root!.path, '/');
      expect(children.length, 2);
      expect(grandchildren.length, 1);
      expect(grandchildren.first.title, '孫1');
    });

    test('異なるツリーに同じパスのノードを保存できること', () async {
      // ツリー2を作成
      await db.insert(DatabaseHelper.tableTrees, {'id': 2, 'name': 'Tree2'});
      
      await dao.insert(NodeModel(treeId: 1, path: '/', title: 'ツリー1ルート', url: 'https://tree1.com'));
      await dao.insert(NodeModel(treeId: 2, path: '/', title: 'ツリー2ルート', url: 'https://tree2.com'));

      final tree1Root = await dao.getByPath(1, '/');
      final tree2Root = await dao.getByPath(2, '/');

      expect(tree1Root!.title, 'ツリー1ルート');
      expect(tree2Root!.title, 'ツリー2ルート');
    });

    test('ツリー別にノードを取得できること', () async {
      // ツリー2を作成
      await db.insert(DatabaseHelper.tableTrees, {'id': 2, 'name': 'Tree2'});
      
      await dao.insert(NodeModel(treeId: 1, path: '/0', title: 'ツリー1子', url: 'https://tree1.com'));
      await dao.insert(NodeModel(treeId: 2, path: '/0', title: 'ツリー2子', url: 'https://tree2.com'));
      await dao.insert(NodeModel(treeId: 2, path: '/1', title: 'ツリー2子2', url: 'https://tree2-2.com'));

      final tree1Nodes = await dao.getAllByTreeId(1);
      final tree2Nodes = await dao.getAllByTreeId(2);

      expect(tree1Nodes.length, 1);
      expect(tree2Nodes.length, 2);
    });
  });
}
