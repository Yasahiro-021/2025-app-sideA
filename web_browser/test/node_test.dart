import 'package:test/test.dart';

import 'package:web_browser/node/node.dart';

void main() {
  group('Node', () {
    test('Nodeのコンストラクタは名前と親を正しく設定する', () {
      final root = Node('root');
      expect(root.name, 'root');

      final child = Node('child', root);
      expect(child.name, 'child');
      expect(child.parent, root);
      // 親ノードの子リストにも自動追加される
      expect(root.children, contains(child));
    });

    test('addChildは子ノードを正しく追加する', () {
      final parent = Node('parent');
      final child1 = Node('child1');
      final child2 = Node('child2');

      parent.addChild(child1);
      parent.addChild(child2);

      expect(parent.children, containsAll([child1, child2]));
      expect(parent.children.length, 2);
    });

    test('親指定でノードを作成すると自動的に親の子リストに追加される', () {
      final parent = Node('parent');
      final child = Node('child', parent);

      expect(parent.children, contains(child));
      expect(child.parent, parent);
    });

    test('addChildで重複する子ノードは追加されない', () {
      final parent = Node('parent');
      final child = Node('child');

      parent.addChild(child);
      parent.addChild(child);

      expect(parent.children.length, 1);
    });
  });
}