import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/model/browser_node.dart';

void main() {
  group('BrowserNode', () {
    late BrowserNode rootNode;
    late BrowserNode node;

    setUp(() {
      rootNode = BrowserNode(title: 'Example', url: 'https://example.com');
      node = BrowserNode(
        title: 'example title',
        url: 'https://example.com/hoge',
      );
    });

    test('正常にルートのインスタンスが作成できること', () {
      expect(rootNode.title, 'Example');
      expect(rootNode.url, 'https://example.com');
    });

    test('正常に通常のノードが作成できること', () {
      expect(node.title, 'example title');
      expect(node.url, 'https://example.com/hoge');
    });

    test('ノードの比較が正しく動作すること', () {
      expect(node == node, isTrue);
      expect(node == rootNode, isFalse);

      final anotherNode = node.copyWith();

      expect(anotherNode == node, isTrue);
    });

    test('copyWithが正しく動くこと', () {
      final modifiedNode = node.copyWith(title: 'Modified Title');
      expect(modifiedNode.title, 'Modified Title');
      expect(modifiedNode.url, node.url);
    });
    });
}
