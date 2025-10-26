import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/ui/buttom_bar/child_node.dart';

void main() {
  group('ChildNode Tests', () {
    testWidgets('should display node name correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChildNode(nodeName: 'Child Node'),
          ),
        ),
      );

      // Verify node name is displayed
      expect(find.text('Child Node'), findsOneWidget);
    });

    testWidgets('should have text size of 14', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChildNode(nodeName: 'Child Node'),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(find.byType(Text));

      // Verify text size
      expect(textWidget.style?.fontSize, 14);
    });

    testWidgets('should truncate long text with ellipsis', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100, // Constrain width to force overflow
              child: ChildNode(
                nodeName: 'This is a very long child node name that should be truncated',
              ),
            ),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(find.byType(Text));

      // Verify text overflow is set to ellipsis
      expect(textWidget.overflow, TextOverflow.ellipsis);
    });

    testWidgets('should display different node names', (WidgetTester tester) async {
      // Test with first node name
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChildNode(nodeName: 'Child A'),
          ),
        ),
      );
      expect(find.text('Child A'), findsOneWidget);

      // Test with second node name
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ChildNode(nodeName: 'Child B'),
          ),
        ),
      );
      expect(find.text('Child B'), findsOneWidget);
    });
  });
}
