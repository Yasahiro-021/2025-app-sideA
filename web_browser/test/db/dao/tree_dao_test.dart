import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_browser/db/models/tree_model.dart';
import 'package:web_browser/db/database_helper.dart';

/// テスト用のインメモリデータベースを使用するTreeDao
class TestTreeDao {
  final Database db;

  TestTreeDao(this.db);

  Future<int> insert(TreeModel tree) async {
    final now = DateTime.now().toIso8601String();
    final treeWithTimestamp = tree.copyWith(
      createdAt: tree.createdAt ?? now,
      updatedAt: now,
    );
    return await db.insert(
      DatabaseHelper.tableTrees,
      treeWithTimestamp.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<TreeModel?> getById(int id) async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }

  Future<TreeModel?> getByName(String name) async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'name = ?',
      whereArgs: [name],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }

  Future<List<TreeModel>> getAll() async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      orderBy: 'updated_at DESC',
    );
    return maps.map((map) => TreeModel.fromMap(map)).toList();
  }

  Future<int> update(TreeModel tree) async {
    if (tree.id == null) {
      throw ArgumentError('更新するツリーにはIDが必要です');
    }
    final now = DateTime.now().toIso8601String();
    final treeWithTimestamp = tree.copyWith(updatedAt: now);
    return await db.update(
      DatabaseHelper.tableTrees,
      treeWithTimestamp.toMap(),
      where: 'id = ?',
      whereArgs: [tree.id],
    );
  }

  Future<void> touch(int treeId) async {
    final now = DateTime.now().toIso8601String();
    await db.update(
      DatabaseHelper.tableTrees,
      {'updated_at': now},
      where: 'id = ?',
      whereArgs: [treeId],
    );
  }

  Future<int> delete(int id) async {
    return await db.delete(
      DatabaseHelper.tableTrees,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAll() async {
    return await db.delete(DatabaseHelper.tableTrees);
  }
}

void main() {
  // FFIを使用してテスト環境でSQLiteを動作させる
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late TestTreeDao dao;

  setUp(() async {
    // インメモリデータベースを作成
    db = await openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ${DatabaseHelper.tableTrees} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL UNIQUE,
            created_at TEXT,
            updated_at TEXT
          )
        ''');
      },
    );
    dao = TestTreeDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('TreeDao', () {
    test('ツリーを挿入できること', () async {
      final tree = TreeModel(name: 'テストツリー');
      final id = await dao.insert(tree);

      expect(id, greaterThan(0));
    });

    test('挿入したツリーをIDで取得できること', () async {
      final tree = TreeModel(name: 'テストツリー');
      final id = await dao.insert(tree);

      final retrieved = await dao.getById(id);

      expect(retrieved, isNotNull);
      expect(retrieved!.id, id);
      expect(retrieved.name, 'テストツリー');
      expect(retrieved.createdAt, isNotNull);
      expect(retrieved.updatedAt, isNotNull);
    });

    test('挿入したツリーを名前で取得できること', () async {
      final tree = TreeModel(name: 'ユニークな名前');
      await dao.insert(tree);

      final retrieved = await dao.getByName('ユニークな名前');

      expect(retrieved, isNotNull);
      expect(retrieved!.name, 'ユニークな名前');
    });

    test('存在しないIDで取得するとnullが返ること', () async {
      final retrieved = await dao.getById(999);

      expect(retrieved, isNull);
    });

    test('存在しない名前で取得するとnullが返ること', () async {
      final retrieved = await dao.getByName('存在しない名前');

      expect(retrieved, isNull);
    });

    test('全ツリーを取得できること', () async {
      await dao.insert(TreeModel(name: 'ツリー1'));
      await Future.delayed(Duration(milliseconds: 10)); // 順序を確実にする
      await dao.insert(TreeModel(name: 'ツリー2'));
      await Future.delayed(Duration(milliseconds: 10));
      await dao.insert(TreeModel(name: 'ツリー3'));

      final all = await dao.getAll();

      expect(all.length, 3);
      // 更新日時の降順で取得される
      expect(all[0].name, 'ツリー3');
      expect(all[1].name, 'ツリー2');
      expect(all[2].name, 'ツリー1');
    });

    test('ツリーを更新できること', () async {
      final id = await dao.insert(TreeModel(name: '更新前'));
      final tree = await dao.getById(id);
      final originalUpdatedAt = tree!.updatedAt;

      await Future.delayed(Duration(milliseconds: 10));
      await dao.update(tree.copyWith(name: '更新後'));
      final updated = await dao.getById(id);

      expect(updated!.name, '更新後');
      expect(updated.updatedAt != originalUpdatedAt, isTrue);
    });

    test('IDがnullのツリーを更新しようとするとエラーになること', () async {
      final tree = TreeModel(name: 'テスト');

      expect(() => dao.update(tree), throwsArgumentError);
    });

    test('ツリーの更新日時のみを更新できること', () async {
      final id = await dao.insert(TreeModel(name: 'タッチテスト'));
      final tree = await dao.getById(id);
      final originalUpdatedAt = tree!.updatedAt;

      await Future.delayed(Duration(milliseconds: 10));
      await dao.touch(id);
      final touched = await dao.getById(id);

      expect(touched!.name, 'タッチテスト');
      expect(touched.updatedAt != originalUpdatedAt, isTrue);
    });

    test('ツリーを削除できること', () async {
      final id = await dao.insert(TreeModel(name: '削除するツリー'));

      await dao.delete(id);
      final retrieved = await dao.getById(id);

      expect(retrieved, isNull);
    });

    test('全ツリーを削除できること', () async {
      await dao.insert(TreeModel(name: 'ツリー1'));
      await dao.insert(TreeModel(name: 'ツリー2'));

      await dao.deleteAll();
      final all = await dao.getAll();

      expect(all.length, 0);
    });

    test('同じ名前のツリーは上書きされること', () async {
      await dao.insert(TreeModel(name: '重複する名前'));
      await dao.insert(TreeModel(name: '重複する名前'));

      final all = await dao.getAll();

      expect(all.length, 1);
    });
  });
}
