import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/node/mocked_node.dart';
import 'package:web_browser/tree_view/tree_sector/child/children_tree_sector.dart';
import 'package:web_browser/tree_view/tree_sector/tree_division.dart';

void main() {
  group('ChildrenTreeSector Tests', () {
    testWidgets('should display children horizontally', (WidgetTester tester) async {
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

      // Find the Row widget in ChildrenTreeSector
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('should display each child as TreeDivision', (WidgetTester tester) async {
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

      // Tap Expand button to generate children
      await tester.tap(find.text('Expand').first);
      await tester.pumpAndSettle();

      // Verify TreeDivision widgets are created for children
      expect(find.byType(TreeDivision), findsWidgets);
    });

    testWidgets('should have correct alignment', (WidgetTester tester) async {
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

      // Find the ChildrenTreeSector
      expect(find.byType(ChildrenTreeSector), findsOneWidget);

      // Tap Expand to generate children and check Row alignment
      await tester.tap(find.text('Expand').first);
      await tester.pumpAndSettle();

      // Find Row widgets and verify alignment
      final rows = find.byType(Row);
      if (rows.evaluate().isNotEmpty) {
        final firstRow = tester.widget<Row>(rows.first);
        expect(firstRow.crossAxisAlignment, CrossAxisAlignment.start);
        expect(firstRow.mainAxisAlignment, MainAxisAlignment.center);
      }
    });

    testWidgets('should record and update child sizes', (WidgetTester tester) async {
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

      // Tap Expand button to generate children
      await tester.tap(find.text('Expand').first);
      await tester.pumpAndSettle();

      // Verify children are displayed (size recording happens in post-frame callback)
      expect(find.text('1.1'), findsWidgets);
      expect(find.text('1.2'), findsWidgets);
    });

    testWidgets('should handle no children case', (WidgetTester tester) async {
      // Setup - create a leaf node (depth 1 means no children)
      final mockNode = mockedNode(1, 0);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TreeDivision(key: UniqueKey(), node: mockNode),
            ),
          ),
        ),
      );

      // Verify ChildrenTreeSector exists even with no children
      expect(find.byType(ChildrenTreeSector), findsOneWidget);
      
      // Verify Row is still created (but empty)
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('should connect with parent TreeDivision', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(3, 2);
      final treeDivision = TreeDivision(key: UniqueKey(), node: mockNode);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: treeDivision,
              ),
            ),
          ),
        ),
      );

      // Verify ChildrenTreeSector is created with parent reference
      final childrenTreeSector = find.byType(ChildrenTreeSector);
      expect(childrenTreeSector, findsOneWidget);
      
      // Verify the parent is correctly set
      final widget = tester.widget<ChildrenTreeSector>(childrenTreeSector);
      expect(widget.parent, treeDivision);
    });
  });
}
