import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/model/node_children.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/model/node_with_path.dart';

void main() {
  group('NodeChildren', () {
    //子ノードのリストを作成するヘルパー関数。numberは作成するノードの数。
    createNodeWithPathList(int number) {
      List<NodeWithPath> childNodes = [];
      NodePath parentNodePath = NodePath(path: []);
      for (int i = 0; i < number; i++) {
        childNodes.add(
          NodeWithPath(
            title: 'Node $i',
            url: 'http://example.com/node$i',
            path: parentNodePath.createChildPath(i),
            parentPath: parentNodePath,
          ),
        );
      }

      return childNodes;
    }

    ;
    setUp(() {});

    group('初期化', () {
      test('空のリストで初期化できる', () {
        NodeChildren emptyNodeChildren = NodeChildren(children: []);
        expect(emptyNodeChildren.children, isEmpty);
      });

      test('リストを指定して初期化できる', () {
        final children = NodeChildren(children: createNodeWithPathList(5));
        expect(children.children, equals(createNodeWithPathList(5)));
      });
    });

    group('イミュータブル', () {
      NodeChildren nodeChildren = NodeChildren(children: createNodeWithPathList(2));
      test('配列に追加できないこと', () {
        expect(
          () => nodeChildren.children.add(
            NodeWithPath(
              title: 'New Node',
              url: 'http://example.com/newnode',
              path: NodePath(path: []).createChildPath(0),
              parentPath: NodePath(path: []),
            ),
          ),
          throwsA(isA<UnsupportedError>()),
        );
      });

      // test('配列を置き換えられないこと',skip: "", () {
        
      //     NodeChildren defaultChNodeChildren = NodeChildren(children: []);
      //   expect(
      //     //エラー状態が正常。
      //     () => defaultChNodeChildren.children = [],
      //     throwsA(isA<NoSuchMethodError>()),
      //   );
      // });
    });

    group('length', () {
      test('子ノードの数を取得できること', () {
        NodeChildren nodeChildren = NodeChildren(children: []);
        expect(nodeChildren.children.length, equals(0));

        NodeChildren nodeChildrenWithOneChild = NodeChildren(children: createNodeWithPathList(1));
        expect(nodeChildrenWithOneChild.children.length, equals(1));

        NodeChildren nodeChildrenWithTwoChildren = NodeChildren(children: createNodeWithPathList(2));
        expect(nodeChildrenWithTwoChildren.children.length, equals(2));
      });
    });

    group('isEmpty / isNotEmpty', () {
      test('子ノードが空かどうかを判定できること', () {
        NodeChildren emptyNodeChildren = NodeChildren(children: []);
        expect(emptyNodeChildren.children.isEmpty, isTrue);
        expect(emptyNodeChildren.children.isNotEmpty, isFalse);

        NodeChildren nonEmptyNodeChildren = NodeChildren(children: createNodeWithPathList(3));
        expect(nonEmptyNodeChildren.children.isEmpty, isFalse);
        expect(nonEmptyNodeChildren.children.isNotEmpty, isTrue);
      });
    });

    group('freezed', () {
      test('copyWith:子ノードのリストを変更して新しいインスタンスを作成できること', () {
        NodeChildren originalNodeChildren = NodeChildren(children: createNodeWithPathList(2));

        NodeChildren modifiedNodeChildren = originalNodeChildren.copyWith(
          children: createNodeWithPathList(3),
        );

        expect(modifiedNodeChildren.children, equals(createNodeWithPathList(3)));
        expect(originalNodeChildren.children, equals(createNodeWithPathList(2)));
      });

      test('==演算子:同じ内容のインスタンスは等しいこと', () {
        NodeChildren nodeChildrenA = NodeChildren(children: createNodeWithPathList(2));
        NodeChildren nodeChildrenB = NodeChildren(children: createNodeWithPathList(2));
        NodeChildren nodeChildrenC = NodeChildren(children: createNodeWithPathList(3));

        expect(nodeChildrenA, equals(nodeChildrenB));
        expect(nodeChildrenA, isNot(equals(nodeChildrenC)));
      });
    });
  });
}
