import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/node/mocked_node.dart';
import 'package:web_browser/tree_view/treeview.dart';
import 'package:web_browser/tree_view/tree_sector/tree_division.dart';

void main() {
  group('TreeView Tests', () {
    testWidgets('should display AppBar with "Tree View" title', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(3, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView(rootNode: mockNode),
          ),
        ),
      );

      // Verify AppBar title
      expect(find.text('Tree View'), findsOneWidget);
    });

    testWidgets('should display InteractiveViewer with correct settings', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(3, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView(rootNode: mockNode),
          ),
        ),
      );

      // Find InteractiveViewer
      final interactiveViewer = find.byType(InteractiveViewer);
      expect(interactiveViewer, findsOneWidget);

      // Verify InteractiveViewer settings
      final interactiveViewerWidget = tester.widget<InteractiveViewer>(interactiveViewer);
      expect(interactiveViewerWidget.constrained, false);
      expect(interactiveViewerWidget.boundaryMargin, EdgeInsets.all(100));
      expect(interactiveViewerWidget.maxScale, 1000);
      expect(interactiveViewerWidget.minScale, 0.001);
    });

    testWidgets('should display root node', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(3, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView(rootNode: mockNode),
          ),
        ),
      );

      // Verify root node is displayed
      expect(find.text('1'), findsWidgets);
    });

    testWidgets('should display TreeDivision widget', (WidgetTester tester) async {
      // Setup
      final mockNode = mockedNode(3, 2);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView(rootNode: mockNode),
          ),
        ),
      );

      // Verify TreeDivision is displayed
      expect(find.byType(TreeDivision), findsOneWidget);
    });

    testWidgets('should pass mocked node correctly', (WidgetTester tester) async {
      // Setup - Create a mocked node with depth 10 and width 3
      final mockNode = mockedNode(10, 3);
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView(rootNode: mockNode),
          ),
        ),
      );

      // Verify TreeView is built successfully with the mock node
      expect(find.byType(TreeView), findsOneWidget);
      expect(find.byType(TreeDivision), findsOneWidget);

      // Verify the root node name
      expect(find.text('1'), findsWidgets);
    });

    testWidgets('should use factory constructor with mocking node', (WidgetTester tester) async {
      // Setup - Use the factory constructor
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: TreeView.mockingNode(),
          ),
        ),
      );

      // Verify TreeView is built successfully
      expect(find.byType(TreeView), findsOneWidget);
      expect(find.text('Tree View'), findsOneWidget);
    });
  });
}
