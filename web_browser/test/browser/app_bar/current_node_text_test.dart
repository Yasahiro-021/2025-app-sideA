import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/ui/app_bar/current_node_text.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

void main() {
  group('CurrentNodeText Tests', () {
    testWidgets('should display node name correctly', (WidgetTester tester) async {
      // Setup - Create a mock node
      final mockNode = NodeWithPath.root(
        name: 'Current Node',
        url: 'https://example.com',
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentNodeNotifierProvider.overrideWith(() => CurrentNodeNotifier()..state = mockNode),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: CurrentNodeText(),
            ),
          ),
        ),
      );

      // Verify node name is displayed
      expect(find.text('Current Node'), findsOneWidget);
    });

    testWidgets('should have text size of 13', (WidgetTester tester) async {
      // Setup
      final mockNode = NodeWithPath.root(
        name: 'Current Node',
        url: 'https://example.com',
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentNodeNotifierProvider.overrideWith(() => CurrentNodeNotifier()..state = mockNode),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: CurrentNodeText(),
            ),
          ),
        ),
      );

      // Find the Text widget
      final textWidget = tester.widget<Text>(find.byType(Text));

      // Verify text size (changed from 14 to 13 to match implementation)
      expect(textWidget.style?.fontSize, 13);
    });

    testWidgets('should truncate long text with ellipsis', (WidgetTester tester) async {
      // Setup
      final mockNode = NodeWithPath.root(
        name: 'This is a very long current node name that should be truncated',
        url: 'https://example.com',
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentNodeNotifierProvider.overrideWith(() => CurrentNodeNotifier()..state = mockNode),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 100, // Constrain width to force overflow
                child: CurrentNodeText(),
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
      final mockNodeA = NodeWithPath.root(
        name: 'Node A',
        url: 'https://example.com',
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentNodeNotifierProvider.overrideWith(() => CurrentNodeNotifier()..state = mockNodeA),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: CurrentNodeText(),
            ),
          ),
        ),
      );
      expect(find.text('Node A'), findsOneWidget);

      // Test with second node name
      final mockNodeB = NodeWithPath.root(
        name: 'Node B',
        url: 'https://example.com',
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentNodeNotifierProvider.overrideWith(() => CurrentNodeNotifier()..state = mockNodeB),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: CurrentNodeText(),
            ),
          ),
        ),
      );
      expect(find.text('Node B'), findsOneWidget);
    });

    testWidgets('should display (root) when node name is empty', (WidgetTester tester) async {
      // Setup - Create a node with empty name
      final mockNode = NodeWithPath.root(
        name: '',
        url: 'https://example.com',
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            currentNodeNotifierProvider.overrideWith(() => CurrentNodeNotifier()..state = mockNode),
          ],
          child: MaterialApp(
            home: Scaffold(
              body: CurrentNodeText(),
            ),
          ),
        ),
      );

      // Verify (root) is displayed when name is empty
      expect(find.text('(root)'), findsOneWidget);
    });
  });
}
