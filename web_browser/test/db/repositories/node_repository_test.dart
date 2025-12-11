import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_browser/db/models/node_model.dart';
import 'package:web_browser/db/database_helper.dart';
import 'package:web_browser/node/node.dart';

/// テスト用のリポジトリクラス
/// 
/// インメモリデータベースを使用してテストを行う
class TestNodeRepository {
  final Database db;

  TestNodeRepository(this.db);

  /// ツリー全体を保存
  Future<void> saveTree(Node rootNode) async {
    await db.delete(DatabaseHelper.tableNodes);
    await _saveNodeRecursively(rootNode, null);
  }

  Future<void> _saveNodeRecursively(Node node, int? parentId) async {
    final nodeModel = NodeModel(
      name: node.name,
      parentId: parentId,
    );
    final insertedId = await db.insert(
      DatabaseHelper.tableNodes,
      nodeModel.toMap(),
    );

    for (final child in node.children) {
      await _saveNodeRecursively(child, insertedId);
    }
  }

  /// ツリー全体を読み込み
  Future<Node?> loadTree() async {
    final rootMaps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'parent_id IS NULL',
    );
    if (rootMaps.isEmpty) return null;

    final rootModel = NodeModel.fromMap(rootMaps.first);
    return await _buildNodeRecursively(rootModel, null);
  }

  Future<Node> _buildNodeRecursively(NodeModel model, Node? parent) async {
    final node = Node(model.name, parent);

    if (model.id != null) {
      final childMaps = await db.query(
        DatabaseHelper.tableNodes,
        where: 'parent_id = ?',
        whereArgs: [model.id],
      );
      for (final childMap in childMaps) {
        final childModel = NodeModel.fromMap(childMap);
        await _buildNodeRecursively(childModel, node);
      }
    }

    return node;
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

  setUp(() async {
    // インメモリデータベースを作成
    db = await openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ${DatabaseHelper.tableNodes} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            parent_id INTEGER,
            FOREIGN KEY (parent_id) REFERENCES ${DatabaseHelper.tableNodes} (id) ON DELETE CASCADE
          )
        ''');
      },
    );
    repository = TestNodeRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('NodeRepository', () {
    test('単一ノードのツリーを保存・読み込みできること', () async {
      final root = Node('ルート');

      await repository.saveTree(root);
      final loaded = await repository.loadTree();

      expect(loaded, isNotNull);
      expect(loaded!.name, 'ルート');
      expect(loaded.children, isEmpty);
      expect(loaded.parent, isNull);
    });

    test('2階層のツリーを保存・読み込みできること', () async {
      final root = Node('ルート');
      Node('子1', root);
      Node('子2', root);

      await repository.saveTree(root);
      final loaded = await repository.loadTree();

      expect(loaded, isNotNull);
      expect(loaded!.name, 'ルート');
      expect(loaded.children.length, 2);
      expect(loaded.children.map((n) => n.name).toList(), containsAll(['子1', '子2']));
    });

    test('3階層のツリーを保存・読み込みできること', () async {
      // ルート
      //   ├── 子1
      //   │   └── 孫1
      //   └── 子2
      final root = Node('ルート');
      final child1 = Node('子1', root);
      Node('子2', root);
      Node('孫1', child1);

      await repository.saveTree(root);
      final loaded = await repository.loadTree();

      expect(loaded, isNotNull);
      expect(loaded!.name, 'ルート');
      expect(loaded.children.length, 2);

      final loadedChild1 = loaded.children.firstWhere((n) => n.name == '子1');
      expect(loadedChild1.children.length, 1);
      expect(loadedChild1.children.first.name, '孫1');
    });

    test('複雑なツリー構造を保存・読み込みできること', () async {
      // ルート
      //   ├── 子1
      //   │   ├── 孫1-1
      //   │   └── 孫1-2
      //   ├── 子2
      //   │   └── 孫2-1
      //   │       └── ひ孫2-1-1
      //   └── 子3
      final root = Node('ルート');
      final child1 = Node('子1', root);
      final child2 = Node('子2', root);
      Node('子3', root);
      Node('孫1-1', child1);
      Node('孫1-2', child1);
      final grandchild21 = Node('孫2-1', child2);
      Node('ひ孫2-1-1', grandchild21);

      await repository.saveTree(root);
      final loaded = await repository.loadTree();

      expect(loaded, isNotNull);
      expect(loaded!.children.length, 3);

      // 子1の孫を確認
      final loadedChild1 = loaded.children.firstWhere((n) => n.name == '子1');
      expect(loadedChild1.children.length, 2);

      // 子2の孫とひ孫を確認
      final loadedChild2 = loaded.children.firstWhere((n) => n.name == '子2');
      expect(loadedChild2.children.length, 1);
      expect(loadedChild2.children.first.children.length, 1);
      expect(loadedChild2.children.first.children.first.name, 'ひ孫2-1-1');
    });

    test('データがない場合はnullが返ること', () async {
      final loaded = await repository.loadTree();

      expect(loaded, isNull);
    });

    test('上書き保存ができること', () async {
      final root1 = Node('旧ルート');
      Node('旧子', root1);
      await repository.saveTree(root1);

      final root2 = Node('新ルート');
      Node('新子1', root2);
      Node('新子2', root2);
      await repository.saveTree(root2);

      final loaded = await repository.loadTree();

      expect(loaded, isNotNull);
      expect(loaded!.name, '新ルート');
      expect(loaded.children.length, 2);
      expect(loaded.children.map((n) => n.name).toList(), containsAll(['新子1', '新子2']));
    });

    test('clearAllで全データが削除されること', () async {
      final root = Node('ルート');
      Node('子', root);
      await repository.saveTree(root);

      await repository.clearAll();
      final loaded = await repository.loadTree();

      expect(loaded, isNull);
    });

    test('親子関係が正しく復元されること', () async {
      final root = Node('ルート');
      final child = Node('子', root);
      Node('孫', child);

      await repository.saveTree(root);
      final loaded = await repository.loadTree();

      expect(loaded!.parent, isNull);
      expect(loaded.children.first.parent, loaded);
      expect(loaded.children.first.children.first.parent, loaded.children.first);
    });
  });
}
