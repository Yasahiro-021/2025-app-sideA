import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/node/mocked_node.dart';
import 'package:web_browser/router/router.dart';

void main() {
  group('Router Tests', () {
    testWidgets('should have initial location at "/"', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        ),
      );

      // Verify home page is displayed at initial location
      expect(find.text('適材適書'), findsOneWidget);
    });

    testWidgets('should navigate to HomeRoute correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        ),
      );

      // Verify home page is displayed
      expect(find.text('適材適書'), findsOneWidget);
      expect(find.text('to browser!'), findsOneWidget);
      expect(find.text('to treeview!'), findsOneWidget);
    });

    testWidgets('should navigate to BrowserViewRoute correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        ),
      );

      // Act: Navigate to browser
      await tester.tap(find.text('to browser!'));
      await tester.pumpAndSettle();

      // Verify browser screen is displayed
      expect(find.text('コンテンツ領域'), findsOneWidget);
      expect(find.text('親'), findsOneWidget);
      expect(find.text('current node'), findsOneWidget);
    });

    testWidgets('should navigate to TreeViewRoute correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        ),
      );

      // Act: Navigate to tree view
      await tester.tap(find.text('to treeview!'));
      await tester.pumpAndSettle();

      // Verify tree view screen is displayed
      expect(find.text('Tree View'), findsOneWidget);
    });

    testWidgets('should pass Node parameter to TreeViewRoute correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        ),
      );

      // Act: Navigate to tree view (which passes mockedNode(10, 3))
      await tester.tap(find.text('to treeview!'));
      await tester.pumpAndSettle();

      // Verify tree view screen is displayed with the passed node
      expect(find.text('Tree View'), findsOneWidget);
      // Root node should be displayed
      expect(find.text('1'), findsWidgets);
    });

    testWidgets('should handle route transitions correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        ),
      );

      // Start at home
      expect(find.text('適材適書'), findsOneWidget);

      // Navigate to browser
      await tester.tap(find.text('to browser!'));
      await tester.pumpAndSettle();
      expect(find.text('コンテンツ領域'), findsOneWidget);

      // Navigate back to home
      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.text('適材適書'), findsOneWidget);

      // Navigate to tree view
      await tester.tap(find.text('to treeview!'));
      await tester.pumpAndSettle();
      expect(find.text('Tree View'), findsOneWidget);

      // Navigate back to home
      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.text('適材適書'), findsOneWidget);
    });
  });
}
