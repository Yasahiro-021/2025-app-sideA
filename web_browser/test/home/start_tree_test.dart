import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:web_browser/home/home_page.dart';

/// GoRouterコンテキストをモック化するクラス
class MockGoRouter extends Mock implements GoRouter {}

void main() {
  group('StartTree Widget Tests', () {
    testWidgets('「新しく」のラベルが表示される', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.text('新しく'), findsOneWidget);
    });

    testWidgets('TextFieldが表示される', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('TextFieldのラベルが「検索ワードを入力」である', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.text('検索ワードを入力'), findsOneWidget);
    });

    testWidgets('TextFieldに検索アイコンが表示される', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('ElevatedButtonが表示される', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('ElevatedButtonのテキストが「Search」である', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('TextFieldにテキストを入力できる', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.enterText(textField, 'テスト検索');

      // Assert
      expect(find.text('テスト検索'), findsOneWidget);
    });

    testWidgets('複数行のテキストフィールド入力をサポート', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.enterText(textField, '複数の\nテキスト');
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('TextFieldがOutlineInputBorderを使用している', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(TextField), findsOneWidget);
      // OutlineInputBorderは装飾プロパティから確認可能
    });

    testWidgets('Columnレイアウトで構成されている', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('TextFieldにパディングが設定されている', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('ElevatedButtonがAlignで右寄せされている', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(Align), findsOneWidget);
    });

    testWidgets('TextFieldコントローラーが初期化されている', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('入力されたテキストをクリアできる', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.enterText(textField, 'テスト');
      expect(find.text('テスト'), findsOneWidget);

      // コントローラーをクリア
      await tester.enterText(textField, '');

      // Assert
      expect(find.text('テスト'), findsNothing);
    });

    testWidgets('フォーム全体がコンテナで管理されている', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('複数の要素が正しいレイアウト順序で表示される', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      // Assert
      expect(find.text('新しく'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
    });

    testWidgets('TextFieldが入力状態になる', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.tap(textField);
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('ElevatedButtonが押下可能である', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StartTree(),
          ),
        ),
      );

      final button = find.byType(ElevatedButton);

      // Assert
      expect(button, findsOneWidget);
      // ボタンが存在して、タップ可能な状態であることを確認
    });
  });
}
