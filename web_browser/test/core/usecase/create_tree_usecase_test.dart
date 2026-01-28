import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:web_browser/core/usecase/create_tree_usecase.dart';
import 'package:web_browser/db/providers/tree_repository_provider.dart';
import 'package:web_browser/db/repositories/tree_repository.dart';
import 'package:web_browser/db/models/tree_model.dart';

import 'create_tree_usecase_test.mocks.dart';

// Mockitoを使用してTreeRepositoryのモックを生成
@GenerateMocks([TreeRepository])
void main() {
  late MockTreeRepository mockRepository;
  late ProviderContainer container;

  setUp(() {
    // Mockitoでモックを作成
    mockRepository = MockTreeRepository();

    // Providerコンテナを作成し、TreeRepositoryをモックでオーバーライド
    container = ProviderContainer(
      overrides: [
        treeRepositoryProviderProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CreateTreeUsecase', () {
    test('正常系: 有効な名前でツリーIDが返る', () async {
      // モックの動作を設定
      when(mockRepository.getTreeByName('新しいツリー'))
          .thenAnswer((_) async => null);
      when(mockRepository.createTree('新しいツリー'))
          .thenAnswer((_) async => 1);

      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('新しいツリー');

      expect(result.isSuccess, isTrue);
      expect(result.treeId, 1);
      expect(result.error, isNull);

      // モックが呼ばれたことを確認
      verify(mockRepository.getTreeByName('新しいツリー')).called(1);
      verify(mockRepository.createTree('新しいツリー')).called(1);
    });

    test('異常系1: 空文字でエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('');

      expect(result.isSuccess, isFalse);
      expect(result.treeId, isNull);
      expect(result.error, CreateTreeError.emptyName);

      // リポジトリは呼ばれていないことを確認
      verifyNever(mockRepository.getTreeByName(any));
      verifyNever(mockRepository.createTree(any));
    });

    test('異常系1: 空白のみでエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('   ');

      expect(result.isSuccess, isFalse);
      expect(result.treeId, isNull);
      expect(result.error, CreateTreeError.emptyName);

      // リポジトリは呼ばれていないことを確認
      verifyNever(mockRepository.getTreeByName(any));
      verifyNever(mockRepository.createTree(any));
    });

    test('異常系1: タブや改行のみでエラー', () async {
      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('\t\n  \r\n');

      expect(result.isSuccess, isFalse);
      expect(result.treeId, isNull);
      expect(result.error, CreateTreeError.emptyName);

      // リポジトリは呼ばれていないことを確認
      verifyNever(mockRepository.getTreeByName(any));
      verifyNever(mockRepository.createTree(any));
    });

    test('異常系2: 同名ツリーが存在する場合にエラー', () async {
      // 既存のツリーをモックで返す
      final existingTree = TreeModel(
        id: 1,
        name: '重複テスト',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      );
      when(mockRepository.getTreeByName('重複テスト'))
          .thenAnswer((_) async => existingTree);

      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('重複テスト');

      expect(result.isSuccess, isFalse);
      expect(result.treeId, isNull);
      expect(result.error, CreateTreeError.duplicateName);

      // getTreeByNameは呼ばれたが、createTreeは呼ばれていないことを確認
      verify(mockRepository.getTreeByName('重複テスト')).called(1);
      verifyNever(mockRepository.createTree(any));
    });

    test('前後の空白を除去して処理される', () async {
      // モックの動作を設定（trimされた名前で呼ばれる）
      when(mockRepository.getTreeByName('前後に空白'))
          .thenAnswer((_) async => null);
      when(mockRepository.createTree('前後に空白'))
          .thenAnswer((_) async => 2);

      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('  前後に空白  ');

      expect(result.isSuccess, isTrue);
      expect(result.treeId, 2);

      // trimされた名前でリポジトリが呼ばれたことを確認
      verify(mockRepository.getTreeByName('前後に空白')).called(1);
      verify(mockRepository.createTree('前後に空白')).called(1);
    });

    test('前後の空白を除去した結果が重複する場合はエラー', () async {
      // 既存のツリーをモックで返す
      final existingTree = TreeModel(
        id: 3,
        name: '空白重複',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      );
      when(mockRepository.getTreeByName('空白重複'))
          .thenAnswer((_) async => existingTree);

      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result = await usecase.create('  空白重複  ');

      expect(result.isSuccess, isFalse);
      expect(result.error, CreateTreeError.duplicateName);

      // trimされた名前でgetTreeByNameが呼ばれたことを確認
      verify(mockRepository.getTreeByName('空白重複')).called(1);
      verifyNever(mockRepository.createTree(any));
    });

    test('異なる名前のツリーは複数作成できる', () async {
      // それぞれのツリーに対してモックを設定
      when(mockRepository.getTreeByName('ツリー1'))
          .thenAnswer((_) async => null);
      when(mockRepository.createTree('ツリー1'))
          .thenAnswer((_) async => 1);

      when(mockRepository.getTreeByName('ツリー2'))
          .thenAnswer((_) async => null);
      when(mockRepository.createTree('ツリー2'))
          .thenAnswer((_) async => 2);

      when(mockRepository.getTreeByName('ツリー3'))
          .thenAnswer((_) async => null);
      when(mockRepository.createTree('ツリー3'))
          .thenAnswer((_) async => 3);

      final usecase = container.read(createTreeUsecaseProvider.notifier);

      final result1 = await usecase.create('ツリー1');
      final result2 = await usecase.create('ツリー2');
      final result3 = await usecase.create('ツリー3');

      expect(result1.isSuccess, isTrue);
      expect(result2.isSuccess, isTrue);
      expect(result3.isSuccess, isTrue);
      expect(result1.treeId, 1);
      expect(result2.treeId, 2);
      expect(result3.treeId, 3);
      expect(result1.treeId, isNot(equals(result2.treeId)));
      expect(result2.treeId, isNot(equals(result3.treeId)));
    });
  });
}
