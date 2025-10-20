import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/home_page.dart';
import 'package:web_browser/router/router.dart';

void main() {
  group('MyHomePage Tests', () {
    testWidgets('should display AppBar title correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: MyHomePage(),
          ),
        ),
      );

      // Verify
      expect(find.text('適材適書'), findsOneWidget);
    });

    testWidgets('should display "to browser!" button', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: MyHomePage(),
          ),
        ),
      );

      // Verify
      expect(find.text('to browser!'), findsOneWidget);
    });

    testWidgets('should display "to treeview!" button', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: MyHomePage(),
          ),
        ),
      );

      // Verify
      expect(find.text('to treeview!'), findsOneWidget);
    });

    testWidgets('should navigate to browser screen when "to browser!" button is tapped', 
      (WidgetTester tester) async {
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

      // Verify initial state
      expect(find.text('適材適書'), findsOneWidget);
      expect(find.text('to browser!'), findsOneWidget);

      // Act: tap browser button
      await tester.tap(find.text('to browser!'));
      await tester.pumpAndSettle();

      // Assert: Browser screen is displayed
      expect(find.text('コンテンツ領域'), findsOneWidget);
    });

    testWidgets('should navigate to tree view screen when "to treeview!" button is tapped',
      (WidgetTester tester) async {
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

      // Verify initial state
      expect(find.text('適材適書'), findsOneWidget);
      expect(find.text('to treeview!'), findsOneWidget);

      // Act: tap treeview button
      await tester.tap(find.text('to treeview!'));
      await tester.pumpAndSettle();

      // Assert: TreeView screen is displayed
      expect(find.text('Tree View'), findsOneWidget);
    });
  });
}
