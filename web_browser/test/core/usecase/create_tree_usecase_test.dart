import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_browser/core/usecase/create_tree_usecase.dart';
import 'package:web_browser/db/database_helper.dart';
import 'package:web_browser/db/providers/tree_repository_provider.dart';
import 'package:web_browser/db/repositories/tree_repository.dart';
import 'package:web_browser/db/models/tree_model.dart';

/// テスト用のTreeRepositoryクラス
class TestTreeRepository extends TreeRepository {
  final Database db;

  TestTreeRepository(this.db);

  @override
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

  @override
  Future<TreeModel?> getTreeByName(String name) async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'name = ?',
      whereArgs: [name],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }

  @override
  Future<TreeModel?> getTreeById(int id) async {
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }
}

void main() {
  // FFIを使用してテスト環境でSQLiteを動作させる
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  late Database db;
  late TestTreeRepository repository;
  late ProviderContainer container;

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

    // Providerコンテナを作成し、TreeRepositoryをオーバーライド
    container = ProviderContainer(
      overrides: [
        treeRepositoryProviderProvider.overrideWithValue(repository),
      ],
    );
  });

  tearDown(() async {
    await db.close();
    container.dispose();
  });

  group('CreateTreeUsecase', () {
    test('正常系: 有効な名前でツリーIDが返る', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('新しいツリー');

      expect(result.isSuccess, isTrue);
      expect(result.treeId, isNotNull);
      expect(result.treeId, greaterThan(0));
      expect(result.error, isNull);

      // DBに保存されていることを確認
      final tree = await repository.getTreeById(result.treeId!);
      expect(tree, isNotNull);
      expect(tree!.name, '新しいツリー');
    });

    test('異常系1: 空文字でエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('');

      expect(result.isSuccess, isFalse);
      expect(result.treeId, isNull);
      expect(result.error, CreateTreeError.emptyName);
    });

    test('異常系1: 空白のみでエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('   ');

      expect(result.isSuccess, isFalse);
      expect(result.treeId, isNull);
      expect(result.error, CreateTreeError.emptyName);
    });

    test('異常系1: タブや改行のみでエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('\t\n  \r\n');

      expect(result.isSuccess, isFalse);
      expect(result.treeId, isNull);
      expect(result.error, CreateTreeError.emptyName);
    });

    test('異常系2: 同名ツリーが存在する場合にエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      // 最初のツリーを作成
      final firstResult = await usecase.create('重複テスト');
      expect(firstResult.isSuccess, isTrue);

      // 同じ名前で再度作成を試みる
      final secondResult = await usecase.create('重複テスト');

      expect(secondResult.isSuccess, isFalse);
      expect(secondResult.treeId, isNull);
      expect(secondResult.error, CreateTreeError.duplicateName);
    });

    test('前後の空白を除去して処理される', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('  前後に空白  ');

      expect(result.isSuccess, isTrue);
      expect(result.treeId, isNotNull);

      // 除去された名前で保存されていることを確認
      final tree = await repository.getTreeById(result.treeId!);
      expect(tree, isNotNull);
      expect(tree!.name, '前後に空白');
    });

    test('前後の空白を除去した結果が重複する場合はエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      // 最初のツリーを作成
      final firstResult = await usecase.create('空白重複');
      expect(firstResult.isSuccess, isTrue);

      // 前後に空白を付けて同じ名前で作成を試みる
      final secondResult = await usecase.create('  空白重複  ');

      expect(secondResult.isSuccess, isFalse);
      expect(secondResult.error, CreateTreeError.duplicateName);
    });

    test('異なる名前のツリーは複数作成できる', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result1 = await usecase.create('ツリー1');
      final result2 = await usecase.create('ツリー2');
      final result3 = await usecase.create('ツリー3');

      expect(result1.isSuccess, isTrue);
      expect(result2.isSuccess, isTrue);
      expect(result3.isSuccess, isTrue);
      expect(result1.treeId, isNot(equals(result2.treeId)));
      expect(result2.treeId, isNot(equals(result3.treeId)));
    });
  });
}
