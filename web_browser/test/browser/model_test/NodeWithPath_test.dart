import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

void main() {
  group('NodeWithPath', () {
    late NodeWithPath rootNode;
    late NodeWithPath firstChildNode;
    late NodeWithPath node;

    setUp(() {
      rootNode = NodeWithPath(
        title: 'Example',
        url: 'https://example.com',
        path: NodePath(path: []),
        parentPath: null,
      );

      firstChildNode = NodeWithPath(
        title: 'First Child',
        url: 'https://example.com/child',
        path: NodePath(path: [0]),
        parentPath: rootNode.path,
      );

      node = NodeWithPath(
        title: 'example title',
        url: 'https://example.com/hoge',
        path: NodePath(path: [0, 1]),
        parentPath: firstChildNode.path,
      );

    });

    test('正常にルートのインスタンスが作成できること', () {
      expect(rootNode.title, 'Example');
      expect(rootNode.url, 'https://example.com');
      expect(rootNode.path, NodePath(path: []));
      expect(rootNode.parentPath, isNull);
    });

    test('正常に通常のノードが作成できること', () {
      expect(node.title, 'example title');
      expect(node.url, 'https://example.com/hoge');
      expect(node.path, NodePath(path: [0, 1]));
      expect(node.parentPath, firstChildNode.path);
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
      expect(modifiedNode.path, node.path);
    });

    test('親のパスを正しく取得できること', () {
      expect(node.parentPath,firstChildNode.path);
    });

    test('１層目の親のパスが正しく取得できること', () {

      // firstChildNodeの親パスはrootNodeのパスであること
      expect(firstChildNode.parentPath, rootNode.path);

    });
    test('ルートノードの親パスはnullであること', () {
      expect(rootNode.parentPath, isNull);
    });
  });
}
