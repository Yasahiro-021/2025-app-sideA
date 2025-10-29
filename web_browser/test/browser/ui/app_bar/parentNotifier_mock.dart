import 'package:hooks_riverpod/hooks_riverpod.dart';

// テスト用の簡易Nodeクラス
class MockNode {
	final String name;
	final MockNode? parent;
	MockNode({required this.name, this.parent});
}

// テスト用のNotifier
class MockCurrentNodeNotifier extends StateNotifier<MockNode> {
	MockCurrentNodeNotifier()
			: super(MockNode(name: '子ノード', parent: MockNode(name: '親ノード')));
}

// Providerのモック
final mockCurrentNodeNotifierProvider =
		StateNotifierProvider<MockCurrentNodeNotifier, MockNode>((ref) {
	return MockCurrentNodeNotifier();
});
