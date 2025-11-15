import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

void main() {
  group('NodeWithPath', () {
    final exampleRootPath = NodePath(path: [0]);
    final examplePath = NodePath(path: [0, 1]);
    late NodeWithPath rootNode;
    late NodeWithPath node;

    setUp(() {
      rootNode = NodeWithPath.root(
        title: 'Example',
        url: 'https://example.com',
        path: exampleRootPath,
      );

      node = NodeWithPath(
        title: 'example title',
        url: 'https://example.com/hoge',
        path: examplePath,
        parentPath: rootNode.path,
      );
    });

    test('正常にルートのインスタンスが作成できること', () {
      expect(rootNode.title, 'Example');
      expect(rootNode.url, 'https://example.com');
      expect(rootNode.path, exampleRootPath);
      expect(switch (rootNode) {
        RootNode() => null,
        NormalNode(:final parentPath) => parentPath,
      }, isNull);
    });

    test('正常に通常のノードが作成できること', () {
      expect(node.title, 'example title');
      expect(node.url, 'https://example.com/hoge');
      expect(node.path, examplePath);
      expect(switch (node) {
        NormalNode(:final parentPath) => parentPath,
        RootNode() => null,
      }, rootNode.path);
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
      //TODO pathの実装後に実装
      NodePath childPath = NodePath(path: [0, 1, 2, 3]);
      NodePath parentPath = NodePath(path: [0, 1, 2]);
    }, skip: "Not implemented yet");
  });
}
