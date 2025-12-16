import 'package:test/test.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/model/group.dart';

void main() {
  group('Group', () {
    test('正しく作成できるか', () {
      final group = Group(
        path: NodePath.root,
        elements: [],
        childrenGroup: [],
        width: 2,
        treeWidth: 5,
      );

      expect(group.path, NodePath.root);
      expect(group.elements, isEmpty);
      expect(group.childrenGroup, isEmpty);
      expect(group.width, 2);
      expect(group.treeWidth, 5);
    });
  });
}
