import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_browser/db/models/tree_model.dart';
import 'package:web_browser/db/database_helper.dart';

/// テスト用のリポジトリクラス
class TestTreeRepository {
  final Database db;

  TestTreeRepository(this.db);

  Future<int> createTree(String name) async {
    final now = DateTime.now().toIso8601String();
    return await db.insert(
      DatabaseHelper.tableTrees,
      {
        'name': name,
        'created_at': now,
        'updated_at': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<TreeModel?> getTreeById(int id) async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }

  Future<TreeModel?> getTreeByName(String name) async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'name = ?',
      whereArgs: [name],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }

  Future<List<TreeModel>> getAllTrees() async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      orderBy: 'updated_at DESC',
    );
    return maps.map((map) => TreeModel.fromMap(map)).toList();
  }

  Future<void> renameTree(int id, String newName) async {
    final tree = await getTreeById(id);
    if (tree == null) {
      throw ArgumentError('指定されたIDのツリーが存在しません: $id');
    }
    final now = DateTime.now().toIso8601String();
    await db.update(
      DatabaseHelper.tableTrees,
      {
        'name': newName,
        'updated_at': now,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> touchTree(int id) async {
    final now = DateTime.now().toIso8601String();
    await db.update(
      DatabaseHelper.tableTrees,
      {'updated_at': now},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTree(int id) async {
    await db.delete(
      DatabaseHelper.tableTrees,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearAll() async {
    await db.delete(DatabaseHelper.tableTrees);
  }
}

void main() {
  // FFIを使用してテスト環境でSQLiteを動作させる
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late TestTreeRepository repository;

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
    repository = TestTreeRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('TreeRepository', () {
    test('ツリーを作成できること', () async {
      final id = await repository.createTree('新しいツリー');

      expect(id, greaterThan(0));

      final tree = await repository.getTreeById(id);
      expect(tree, isNotNull);
      expect(tree!.name, '新しいツリー');
    });

    test('IDでツリーを取得できること', () async {
      final id = await repository.createTree('テストツリー');

      final tree = await repository.getTreeById(id);

      expect(tree, isNotNull);
      expect(tree!.id, id);
      expect(tree.name, 'テストツリー');
    });

    test('名前でツリーを取得できること', () async {
      await repository.createTree('検索用ツリー');

      final tree = await repository.getTreeByName('検索用ツリー');

      expect(tree, isNotNull);
      expect(tree!.name, '検索用ツリー');
    });

    test('存在しないIDのツリーはnullが返ること', () async {
      final tree = await repository.getTreeById(999);

      expect(tree, isNull);
    });

    test('全ツリーを取得できること（更新日時順）', () async {
      await repository.createTree('古いツリー');
      await Future.delayed(Duration(milliseconds: 10));
      await repository.createTree('新しいツリー');

      final trees = await repository.getAllTrees();

      expect(trees.length, 2);
      expect(trees[0].name, '新しいツリー');
      expect(trees[1].name, '古いツリー');
    });

    test('ツリー名を変更できること', () async {
      final id = await repository.createTree('変更前');

      await repository.renameTree(id, '変更後');
      final tree = await repository.getTreeById(id);

      expect(tree!.name, '変更後');
    });

    test('存在しないIDのツリー名を変更しようとするとエラーになること', () async {
      expect(
        () => repository.renameTree(999, '新しい名前'),
        throwsArgumentError,
      );
    });

    test('ツリーの更新日時を更新できること', () async {
      final id = await repository.createTree('タッチテスト');
      final originalTree = await repository.getTreeById(id);

      await Future.delayed(Duration(milliseconds: 10));
      await repository.touchTree(id);
      final touchedTree = await repository.getTreeById(id);

      expect(touchedTree!.updatedAt != originalTree!.updatedAt, isTrue);
    });

    test('ツリーを削除できること', () async {
      final id = await repository.createTree('削除するツリー');

      await repository.deleteTree(id);
      final tree = await repository.getTreeById(id);

      expect(tree, isNull);
    });

    test('全ツリーを削除できること', () async {
      await repository.createTree('ツリー1');
      await repository.createTree('ツリー2');

      await repository.clearAll();
      final trees = await repository.getAllTrees();

      expect(trees.isEmpty, isTrue);
    });

    test('複数ツリーの管理ができること', () async {
      // 仕事用ツリー
      final workId = await repository.createTree('仕事');
      // 個人用ツリー
      final personalId = await repository.createTree('個人');
      // 趣味用ツリー
      final hobbyId = await repository.createTree('趣味');

      final trees = await repository.getAllTrees();

      expect(trees.length, 3);

      // 各ツリーが取得できる
      final work = await repository.getTreeById(workId);
      final personal = await repository.getTreeById(personalId);
      final hobby = await repository.getTreeById(hobbyId);

      expect(work!.name, '仕事');
      expect(personal!.name, '個人');
      expect(hobby!.name, '趣味');
    });
  });
}
