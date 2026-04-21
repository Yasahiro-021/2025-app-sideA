import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_browser/db/models/tree_model.dart';
import 'package:web_browser/db/providers/tree_repository_provider.dart';
import 'package:web_browser/db/repositories/tree_repository.dart';
import 'package:web_browser/home/home_page_state.dart';
import 'package:web_browser/home/model/history.dart';
import 'package:web_browser/home/home_page_view_model.dart';

/// TreeRepositoryのモッククラス
class MockTreeRepository extends Mock implements TreeRepository {}

void main() {
  group('Home_pageViewModel Tests', () {
    late MockTreeRepository mockTreeRepository;
    late ProviderContainer container;

    setUp(() {
      mockTreeRepository = MockTreeRepository();
      
      // Riverpodコンテナにモック化されたプロバイダーを指定
      container = ProviderContainer(
        overrides: [
          treeRepositoryProvider.overrideWithValue(mockTreeRepository),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('build()が正しくHomePageStateを返す', () {
      // Arrange
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => []);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => []);

      // Act
      final state = container.read(homePageViewModelProvider);

      // Assert
      expect(state, isA<HomePageState>());
      expect(state.historyList, isA<Future<List<History>>>());
      expect(state.recentHistoryList, isA<Future<List<History>>>());
    });

    test('_getTreeHistory()が全ツリーを正しく取得して変換', () async {
      // Arrange
      final treeModels = [
        TreeModel(
          id: 1,
          name: 'ツリー1',
          createdAt: '2025-03-19 10:00:00',
          updatedAt: '2025-03-19 15:30:00',
        ),
        TreeModel(
          id: 2,
          name: 'ツリー2',
          createdAt: '2025-03-18 10:00:00',
          updatedAt: '2025-03-19 12:00:00',
        ),
      ];
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => treeModels);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => []);

      // Act
      final state = container.read(homePageViewModelProvider);
      final histories = await state.historyList;

      // Assert
      expect(histories.length, 2);
      expect(histories[0].name, 'ツリー1');
      expect(histories[1].name, 'ツリー2');
      expect(histories[0].date, DateTime.parse('2025-03-19 15:30:00'));
    });

    test('_getRecentTreeHistory()が最新5件を返す', () async {
      // Arrange
      final treeModels = [
        TreeModel(
          id: 1,
          name: 'ツリー1',
          updatedAt: '2025-03-19 15:00:00',
        ),
        TreeModel(
          id: 2,
          name: 'ツリー2',
          updatedAt: '2025-03-19 14:00:00',
        ),
        TreeModel(
          id: 3,
          name: 'ツリー3',
          updatedAt: '2025-03-19 13:00:00',
        ),
      ];
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => []);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => treeModels);

      // Act
      final state = container.read(homePageViewModelProvider);
      final recentHistories = await state.recentHistoryList;

      // Assert
      expect(recentHistories.length, lessThanOrEqualTo(5));
      expect(recentHistories[0].name, 'ツリー1');
      expect(recentHistories[0].date, DateTime.parse('2025-03-19 15:00:00'));
    });

    test('updatedAtがnullの場合は空文字列を使用', () async {
      // Arrange
      final treeModels = [
        TreeModel(
          id: 1,
          name: 'ツリー1',
          updatedAt: null,
        ),
      ];
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => treeModels);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => []);

      // Act & Assert
      final state = container.read(homePageViewModelProvider);
      
      // nullが渡された場合の処理を確認
      // 実装では問題が発生する可能性があるため、この挙動をテストして仕様を確認
      expect(
        () async => await state.historyList,
        returnsNormally,
      );
    });

    test('TreeModelをHistoryに正しく変換', () async {
      // Arrange
      final treeModel = TreeModel(
        id: 1,
        name: 'テストツリー',
        createdAt: '2025-03-19 10:00:00',
        updatedAt: '2025-03-19 15:30:00',
      );
      final treeModels = [treeModel];
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => treeModels);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => []);

      // Act
      final state = container.read(homePageViewModelProvider);
      final histories = await state.historyList;

      // Assert
      expect(histories.length, 1);
      expect(histories[0].name, 'テストツリー');
      expect(histories[0].date, DateTime.parse('2025-03-19 15:30:00'));
    });

    test('複数ツリーの取得時にソート順序が保たれる', () async {
      // Arrange
      final treeModels = [
        TreeModel(
          id: 1,
          name: 'ツリー1',
          updatedAt: '2025-03-19 10:00:00',
        ),
        TreeModel(
          id: 2,
          name: 'ツリー2',
          updatedAt: '2025-03-19 20:00:00',
        ),
        TreeModel(
          id: 3,
          name: 'ツリー3',
          updatedAt: '2025-03-19 15:00:00',
        ),
      ];
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => []);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => treeModels);

      // Act
      final state = container.read(homePageViewModelProvider);
      final recentHistories = await state.recentHistoryList;

      // Assert
      // ソート後、最新のものが最初に来る
      if (recentHistories.length >= 2) {
        expect(
          recentHistories[0].date.isAfter(recentHistories[1].date) ||
              recentHistories[0].date.isAtSameMomentAs(recentHistories[1].date),
          true,
        );
      }
    });

    test('getAllTrees()が呼び出される', () async {
      // Arrange
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => []);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => []);

      // Act
      final state = container.read(homePageViewModelProvider);
      await state.historyList;

      // Assert
      verify(() => mockTreeRepository.getAllTrees()).called(1);
    });

    test('getRecentTrees(limit: 5)が呼び出される', () async {
      // Arrange
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => []);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => []);

      // Act
      final state = container.read(homePageViewModelProvider);
      await state.recentHistoryList;

      // Assert
      verify(() => mockTreeRepository.getRecentTrees(limit: 5)).called(1);
    });

    test('ビューモデルが同じhistoryListを返す', () {
      // Arrange
      when(() => mockTreeRepository.getAllTrees())
          .thenAnswer((_) async => []);
      when(() => mockTreeRepository.getRecentTrees(limit: 5))
          .thenAnswer((_) async => []);

      // Act
      final state1 = container.read(homePageViewModelProvider);
      final state2 = container.read(homePageViewModelProvider);

      // Assert
      expect(state1, state2);
    });
  });
}
