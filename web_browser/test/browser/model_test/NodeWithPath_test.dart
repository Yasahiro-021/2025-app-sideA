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
        parent: rootNode,
      );
    });

    test('正常にルートのインスタンスが作成できること', () {
      expect(rootNode.title, 'Example');
      expect(rootNode.url, 'https://example.com');
      expect(rootNode.path, exampleRootPath);
      expect(switch (rootNode) {
        Root() => null,
        Normal(:final parent) => parent,
      }, isNull);
    });

    test('正常に通常のノードが作成できること', () {
      expect(node.title, 'example title');
      expect(node.url, 'https://example.com/hoge');
      expect(node.path, examplePath);
      expect(switch (node) {
        Normal(:final parent) => parent,
        Root() => null,
      }, rootNode);
    });

    test('ノードの比較が正しく動作すること', () {
      NodePath path1 = NodePath(path: [0, 1]);
      NodePath path2 = NodePath(path: [0, 1]);
      NodePath path3 = NodePath(path: [0, 2]);

      expect(path1, equals(path2));
      expect(path1.hashCode, equals(path2.hashCode));
      expect(path1, isNot(equals(path3)));
      expect(path1.hashCode, isNot(equals(path3.hashCode)));
    });

    test('親パスの取得が正しく動作すること', () {
      NodePath childPath = NodePath(path: [0, 1, 2, 3]);
      NodePath parentPath = NodePath(path: [0, 1, 2]);
    }, skip: "Not implemented yet");
  });
}
