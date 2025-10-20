import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/ui/app_bar/current_node_text.dart';

void main() {
  group('CurrentNodeText Tests', () {
    testWidgets('should display node name correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CurrentNodeText(nodeName: 'Current Node'),
          ),
        ),
      );

      // Verify node name is displayed
      expect(find.text('Current Node'), findsOneWidget);
    });

    testWidgets('should have text size of 14', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CurrentNodeText(nodeName: 'Current Node'),
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
              child: CurrentNodeText(
                nodeName: 'This is a very long current node name that should be truncated',
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
            body: CurrentNodeText(nodeName: 'Node A'),
          ),
        ),
      );
      expect(find.text('Node A'), findsOneWidget);

      // Test with second node name
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CurrentNodeText(nodeName: 'Node B'),
          ),
        ),
      );
      expect(find.text('Node B'), findsOneWidget);
    });
  });
}
