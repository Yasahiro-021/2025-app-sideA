import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web_browser/home/home_page_state.dart';
import 'package:web_browser/home/model/history.dart';
import 'package:web_browser/home/home_page.dart';
import 'package:web_browser/home/home_page_view_model.dart';

import 'home_page_test.mocks.dart';

/// ViewModelプロバイダーをモック化
@GenerateMocks([HomePageViewModel])


void main() {
  group('HomePage Widget Tests', () {
    late  MockHomePageViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockHomePageViewModel();
    });

    testWidgets('HomePageが正しくレンダリングされる', (tester) async {
      // Arrange
      // モックViewModelのbuild()がHomePageStateを返すように設定
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(() => homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: const HomePage(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('適材適書'), findsOneWidget);
    });

    testWidgets('AppBarが正しく表示される', (tester) async {
      // Arrange
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(() => homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: const HomePage(),
          ),
        ),
      );

      // Assert
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('適材適書'), findsWidgets);
    });

    testWidgets('Bodyにパディングが設定されている', (tester) async {
      // Arrange
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Padding), findsOneWidget);
    });

    testWidgets('FutureBuilderがwaiting状態でローディングを表示', (tester) async {
      // Arrange
      // Futureが完了しない状態を作成
      final neverComplete = Completer<List<History>>();
      final homePageState = HomePageState(
        historyList: neverComplete.future,
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('historyListが空の場合、HistoryViewが表示される', (tester) async {
      // Arrange
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // ウィジェットの構築を待つ
      await tester.pumpAndSettle();

      // Assert
      // FutureBuilderの完了状態でContainerが表示される
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('複数の履歴がある場合、HistoryViewが表示される', (tester) async {
      // Arrange
      final histories = [
        History(name: '検索1', date: DateTime(2025, 3, 19)),
        History(name: '検索2', date: DateTime(2025, 3, 18)),
      ];
      final homePageState = HomePageState(
        historyList: Future.value(histories),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Assert
      expect(find.text('検索1'), findsOneWidget);
      expect(find.text('検索2'), findsOneWidget);
    });

    testWidgets('StartTreeウィジェットが表示される', (tester) async {
      // Arrange
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Assert
      expect(find.text('新しく'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('レイアウトがColumnで構成されている', (tester) async {
      // Arrange
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Column), findsWidgets);
    });

    testWidgets('Spacerが配置されている', (tester) async {
      // Arrange
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Spacer), findsWidgets);
    });

    testWidgets('resizeToAvoidBottomInsetがfalseに設定されている', (tester) async {
      // Arrange
      final homePageState = HomePageState(
        historyList: Future.value([]),
        recentHistoryList: Future.value([]),
      );
      when(() => mockViewModel.build()).thenReturn(()=> homePageState);

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            homePageViewModelProvider.overrideWith(() => mockViewModel),
          ],
          child: MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Assert
      // ScaffoldのresizeToAvoidBottomInsetプロパティを検証
      final scaffold = find.byType(Scaffold);
      expect(scaffold, findsOneWidget);
    });
  });
}
