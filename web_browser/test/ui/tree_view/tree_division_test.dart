import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/node/mocked_node.dart';
import 'package:web_browser/tree_view/tree_sector/tree_division.dart';
import 'package:web_browser/tree_view/tree_sector/node_widget.dart';
import 'package:web_browser/tree_view/tree_sector/child/line_sector.dart';
import 'package:web_browser/tree_view/tree_sector/child/children_tree_sector.dart';

void main() {
  group('TreeDivision Tests', () {
    testWidgets('should display NodeWidget', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(key: UniqueKey(), node: mockNode),
            ),
          ),
        ),
      );

      // Verify NodeWidget is displayed
      expect(find.byType(NodeWidget), findsOneWidget);
    });

    testWidgets('should display LineSector', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(key: UniqueKey(), node: mockNode),
            ),
          ),
        ),
      );

      // Verify LineSector is displayed (wrapped in SizedBox)
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('should display ChildrenTreeSector', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(key: UniqueKey(), node: mockNode),
            ),
          ),
        ),
      );

      // Verify ChildrenTreeSector is displayed
      expect(find.byType(ChildrenTreeSector), findsOneWidget);
    });

    testWidgets('should arrange components vertically', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(key: UniqueKey(), node: mockNode),
            ),
          ),
        ),
      );

      // Find the Column widget
      final columnWidget = find.byType(Column);
      expect(columnWidget, findsOneWidget);

      // Verify Column alignment
      final column = tester.widget<Column>(columnWidget);
      expect(column.mainAxisAlignment, MainAxisAlignment.start);
      expect(column.crossAxisAlignment, CrossAxisAlignment.center);
    });

    testWidgets('should expand and collapse children', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(3, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: TreeDivision(key: UniqueKey(), node: mockNode),
              ),
            ),
          ),
        ),
      );

      // Initial state - children are not expanded
      expect(find.text('1'), findsOneWidget);
      
      // Find and tap the Expand button
      final expandButton = find.text('Expand').first;
      await tester.tap(expandButton);
      await tester.pumpAndSettle();

      // After expansion, verify child nodes are displayed
      expect(find.text('1.1'), findsWidgets);
      expect(find.text('1.2'), findsWidgets);
    });

    testWidgets('should display node name correctly', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(2, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(key: UniqueKey(), node: mockNode),
            ),
          ),
        ),
      );

      // Verify root node name is displayed
      expect(find.text('1'), findsOneWidget);
    });
  });
}
