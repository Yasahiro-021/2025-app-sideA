import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/node/mocked_node.dart';
import 'package:web_browser/tree_view/tree_sector/node_widget.dart';
import 'package:web_browser/tree_view/tree_sector/tree_division.dart';

void main() {
  group('NodeWidget Tests', () {
    testWidgets('should display node name', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(node: mockNode),
            ),
          ),
        ),
      );

      // Verify node name is displayed (root node is "1")
      expect(find.text('1'), findsWidgets);
    });

    testWidgets('should display "Expand" button', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(node: mockNode),
            ),
          ),
        ),
      );

      // Verify Expand button is displayed
      expect(find.text('Expand'), findsWidgets);
    });

    testWidgets('should have CustomPaint for drawing circle', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(node: mockNode),
            ),
          ),
        ),
      );

      // Verify CustomPaint is used for drawing
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('should have correct size constraints', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(node: mockNode),
            ),
          ),
        ),
      );

      // Verify SizedBox is used with NodeWidget
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('should expand children when Expand button is tapped', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(3, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(node: mockNode),
            ),
          ),
        ),
      );

      // Initial state - find the first Expand button
      final expandButtons = find.text('Expand');
      expect(expandButtons, findsWidgets);

      // Tap the first Expand button
      await tester.tap(expandButtons.first);
      await tester.pumpAndSettle();

      // After expansion, verify children nodes are displayed
      // The mock node with depth 3 and width 2 should have children
      expect(find.text('1.1'), findsWidgets);
    });
  });
}
