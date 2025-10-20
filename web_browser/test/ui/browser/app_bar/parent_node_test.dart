import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/ui/app_bar/parent_node.dart';

void main() {
  group('ParentNode Tests', () {
    testWidgets('should display node name correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParentNode(nodeName: 'Test Node'),
          ),
        ),
      );

      // Verify node name is displayed
      expect(find.text('Test Node'), findsOneWidget);
    });

    testWidgets('should have background color of primaryContainer', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParentNode(nodeName: 'Test Node'),
          ),
        ),
      );

      // Find the Container
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ParentNode),
          matching: find.byType(Container),
        ),
      );

      // Get the color scheme
      final colorScheme = Theme.of(tester.element(find.byType(ParentNode))).colorScheme;

      // Verify background color
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, colorScheme.primaryContainer);
    });

    testWidgets('should have border radius of 8px', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParentNode(nodeName: 'Test Node'),
          ),
        ),
      );

      // Find the Container
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(ParentNode),
          matching: find.byType(Container),
        ),
      );

      // Verify border radius
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(8));
    });

    testWidgets('should have text size of 16', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ParentNode(nodeName: 'Test Node'),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(
        find.descendant(
          of: find.byType(ParentNode),
          matching: find.byType(Text),
        ),
      );

      // Verify text size
      expect(textWidget.style?.fontSize, 16);
    });

    testWidgets('should truncate long text with ellipsis', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100, // Constrain width to force overflow
              child: ParentNode(
                nodeName: 'This is a very long node name that should be truncated',
              ),
            ),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(
        find.descendant(
          of: find.byType(ParentNode),
          matching: find.byType(Text),
        ),
      );

      // Verify text overflow is set to ellipsis
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });
  });
}
