import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/ui/app_bar/parent_node.dart';

// モック用のCurrentNodeとProvider
class MockNode {
  final String name;
  final MockNode? parent;
  MockNode({required this.name, this.parent});
}

final mockParent = MockNode(name: '親ノード');
final mockCurrentNode = MockNode(name: '子ノード', parent: mockParent);

final mockCurrentNodeNotifierProvider = Provider<MockNode>((ref) => mockCurrentNode);

void main() {
  testWidgets('ParentNode UI manual check', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // 実際のProviderをモックで上書き
          // ここは本番のProvider型に合わせて修正してください
          // currentNodeNotifierProvider.overrideWithValue(mockCurrentNode),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: Center(child: ParentNode()),
          ),
        ),
      ),
    );

    // ここで画面を目視確認
    await tester.pumpAndSettle();

    // テストを一時停止して目視確認できるようにする
    await Future.delayed(const Duration(seconds: 10));
  });
}