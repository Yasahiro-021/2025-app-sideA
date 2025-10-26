import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/ui/browser_view_widget.dart';

void main() {
  group('BrowserViewWidget Tests', () {
    testWidgets('should display AppBar correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify AppBar exists
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should display menu button with correct style', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify menu button exists
      expect(find.widgetWithIcon(IconButton, Icons.menu), findsOneWidget);
    });

    testWidgets('should display parent node area correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify parent node is displayed with initial value
      expect(find.text('親'), findsOneWidget);
    });

    testWidgets('should display current node area correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify current node is displayed with initial value
      expect(find.text('current node'), findsOneWidget);
    });

    testWidgets('should display tree view button with correct style', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify tree view button exists
      expect(find.widgetWithIcon(IconButton, Icons.account_tree), findsOneWidget);
    });

    testWidgets('should display content area with text', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify content area displays correct text
      expect(find.text('コンテンツ領域'), findsOneWidget);
    });

    testWidgets('should display search bar correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify search label
      expect(find.text('Search'), findsOneWidget);
      // Verify search icon in search bar
      expect(find.byIcon(Icons.search), findsAtLeastNWidgets(1));
    });

    testWidgets('should have text field that accepts input', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Find the TextField
      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      // Verify hint text
      expect(find.text('検索ワードを入力'), findsOneWidget);
    });

    testWidgets('should display search button', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify search button with text
      expect(find.text('search'), findsOneWidget);
    });

    testWidgets('should display STAY button with correct style', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify STAY button text
      expect(find.text('STAY'), findsOneWidget);
    });

    testWidgets('should display three child node buttons', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Verify three child buttons are displayed
      expect(find.text('子'), findsNWidgets(3));
    });

    testWidgets('should have horizontally scrollable child nodes', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: BrowserViewWidget(),
          ),
        ),
      );

      // Find ListView with horizontal scroll
      final listView = find.byType(ListView);
      expect(listView, findsOneWidget);

      // Verify it's horizontal
      final listViewWidget = tester.widget<ListView>(listView);
      expect(listViewWidget.scrollDirection, Axis.horizontal);
    });
  });
}
