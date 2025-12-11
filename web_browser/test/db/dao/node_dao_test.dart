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

  Future<List<NodeModel>> getAll() async {
    final maps = await db.query(DatabaseHelper.tableNodes);
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  Future<List<NodeModel>> getRootNodes() async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'parent_id IS NULL',
    );
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  Future<List<NodeModel>> getChildrenByParentId(int parentId) async {
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'parent_id = ?',
      whereArgs: [parentId],
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

  Future<int> delete(int id) async {
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'id = ?',
      whereArgs: [id],
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
    dao = TestNodeDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('NodeDao', () {
    test('ノードを挿入できること', () async {
      final node = NodeModel(name: 'テストノード', parentId: null);
      final id = await dao.insert(node);

      expect(id, greaterThan(0));
    });

    test('挿入したノードをIDで取得できること', () async {
      final node = NodeModel(name: 'テストノード', parentId: null);
      final id = await dao.insert(node);

      final retrieved = await dao.getById(id);

      expect(retrieved, isNotNull);
      expect(retrieved!.id, id);
      expect(retrieved.name, 'テストノード');
      expect(retrieved.parentId, isNull);
    });

    test('存在しないIDで取得するとnullが返ること', () async {
      final retrieved = await dao.getById(999);

      expect(retrieved, isNull);
    });

    test('複数のノードを一括挿入できること', () async {
      final nodes = [
        NodeModel(name: 'ノード1', parentId: null),
        NodeModel(name: 'ノード2', parentId: null),
        NodeModel(name: 'ノード3', parentId: null),
      ];

      await dao.insertAll(nodes);
      final all = await dao.getAll();

      expect(all.length, 3);
    });

    test('全ノードを取得できること', () async {
      await dao.insert(NodeModel(name: 'ノード1', parentId: null));
      await dao.insert(NodeModel(name: 'ノード2', parentId: null));

      final all = await dao.getAll();

      expect(all.length, 2);
    });

    test('ルートノードのみ取得できること', () async {
      final rootId = await dao.insert(NodeModel(name: 'ルート', parentId: null));
      await dao.insert(NodeModel(name: '子1', parentId: rootId));
      await dao.insert(NodeModel(name: '子2', parentId: rootId));

      final roots = await dao.getRootNodes();

      expect(roots.length, 1);
      expect(roots.first.name, 'ルート');
    });

    test('指定した親IDを持つ子ノードを取得できること', () async {
      final rootId = await dao.insert(NodeModel(name: 'ルート', parentId: null));
      await dao.insert(NodeModel(name: '子1', parentId: rootId));
      await dao.insert(NodeModel(name: '子2', parentId: rootId));
      await dao.insert(NodeModel(name: '別の子', parentId: null));

      final children = await dao.getChildrenByParentId(rootId);

      expect(children.length, 2);
      expect(children.map((n) => n.name).toList(), containsAll(['子1', '子2']));
    });

    test('ノードを更新できること', () async {
      final id = await dao.insert(NodeModel(name: '更新前', parentId: null));
      final node = await dao.getById(id);
      final updated = node!.copyWith(name: '更新後');

      await dao.update(updated);
      final retrieved = await dao.getById(id);

      expect(retrieved!.name, '更新後');
    });

    test('IDがnullのノードを更新しようとするとエラーになること', () async {
      final node = NodeModel(name: 'テスト', parentId: null);

      expect(() => dao.update(node), throwsArgumentError);
    });

    test('ノードを削除できること', () async {
      final id = await dao.insert(NodeModel(name: 'テスト', parentId: null));

      await dao.delete(id);
      final retrieved = await dao.getById(id);

      expect(retrieved, isNull);
    });

    test('全ノードを削除できること', () async {
      await dao.insert(NodeModel(name: 'ノード1', parentId: null));
      await dao.insert(NodeModel(name: 'ノード2', parentId: null));

      await dao.deleteAll();
      final all = await dao.getAll();

      expect(all.length, 0);
    });

    test('階層構造を持つノードを保存・取得できること', () async {
      // ルート -> 子1 -> 孫1
      //       -> 子2
      final rootId = await dao.insert(NodeModel(name: 'ルート', parentId: null));
      final child1Id = await dao.insert(NodeModel(name: '子1', parentId: rootId));
      await dao.insert(NodeModel(name: '子2', parentId: rootId));
      await dao.insert(NodeModel(name: '孫1', parentId: child1Id));

      final all = await dao.getAll();
      final roots = await dao.getRootNodes();
      final child1Children = await dao.getChildrenByParentId(child1Id);

      expect(all.length, 4);
      expect(roots.length, 1);
      expect(child1Children.length, 1);
      expect(child1Children.first.name, '孫1');
    });
  });
}
