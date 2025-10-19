import 'package:test/test.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

void main() {
  group('NodeWithPath', () {
    test('コンストラクタは名前、パス、URL、親を正しく設定する', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );

      expect(root.name, 'root');
      expect(root.path, '0');
      expect(root.url, 'https://example.com');
      expect(root.parent, isNull);
      expect(root.children, isEmpty);
    });

    test('親ノードを持つNodeWithPathを正しく作成できる', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );
      final child = NodeWithPath(
        name: 'child',
        url: 'https://example.com/child',
        parent: root,
      );

      expect(child.name, 'child');
      expect(child.path, '1-1');
      expect(child.url, 'https://example.com/child');
      expect(child.parent, root);
      // 親ノードの子リストにも自動追加される
      expect(root.children, contains(child));
    });

    test('addChildで子ノードを追加できる', () {
      final parent = NodeWithPath.root(
        name: 'parent',
        url: 'https://example.com',
      );
      final child = NodeWithPath(
        name: 'child',
        url: 'https://example.com/child',
        parent: parent,
      );

      parent.addChild(child);

      expect(parent.children.length, 1);
      expect(parent.children.first, child);
      expect(child.parent, parent);
    });

    test('generateChildPathでルートノードの子のパスを正しく生成する', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );

      expect(root.generateChildPath(1), '1-1');
      expect(root.generateChildPath(2), '1-2');
      expect(root.generateChildPath(3), '1-3');
    });

    test('generateChildPathで通常ノードの子のパスを正しく生成する', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );
      final node = NodeWithPath(
        name: 'node',
        url: 'https://example.com',
        parent: root,
      );

      expect(node.path, '1-1');
      expect(node.generateChildPath(1), '1-1-1');
      expect(node.generateChildPath(2), '1-1-2');
      expect(node.generateChildPath(3), '1-1-3');
    });

    test('depthでルートノードの深さは0を返す', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );

      expect(root.depth, 0);
    });

    test('depthで第1階層のノードの深さは1を返す', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );
      final node = NodeWithPath(
        name: 'node',
        url: 'https://example.com',
        parent: root,
      );

      expect(node.depth, 1);
    });

    test('depthで第2階層のノードの深さは2を返す', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );
      final node1 = NodeWithPath(
        name: 'node1',
        url: 'https://example.com',
        parent: root,
      );
      final node2 = NodeWithPath(
        name: 'node2',
        url: 'https://example.com',
        parent: node1,
      );

      expect(node2.depth, 2);
    });

    test('depthで第3階層のノードの深さは3を返す', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );
      final node1 = NodeWithPath(
        name: 'node1',
        url: 'https://example.com',
        parent: root,
      );
      final node2 = NodeWithPath(
        name: 'node2',
        url: 'https://example.com',
        parent: node1,
      );
      final node3 = NodeWithPath(
        name: 'node3',
        url: 'https://example.com',
        parent: node2,
      );

      expect(node3.depth, 3);
    });

    test('toStringで名前とパスを含む文字列を返す', () {
      final root = NodeWithPath.root(
        name: 'root',
        url: 'https://example.com',
      );
      final node = NodeWithPath(
        name: 'test',
        url: 'https://example.com',
        parent: root,
      );

      expect(node.toString(), contains('test'));
      expect(node.toString(), contains('1-1'));
    });

    test('親子関係が自動的に管理される', () {
      final parent = NodeWithPath.root(
        name: 'parent',
        url: 'https://example.com',
      );
      final child = NodeWithPath(
        name: 'child',
        url: 'https://example.com/child',
        parent: parent,
      );

      // 親ノードの子リストに自動追加される
      expect(parent.children, contains(child));
      // 子ノードの親が設定される
      expect(child.parent, parent);
    });
  });
}
