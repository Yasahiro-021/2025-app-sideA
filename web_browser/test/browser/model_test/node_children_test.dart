import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/browser/model/node_children.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/model/browser_node.dart';

void main() {
    setUp(() {});

    group('初期化', () {
      test('空のリストで初期化できる', () {
        NodeChildren emptyNodeChildren = NodeChildren(children: []);
        expect(emptyNodeChildren.children, isEmpty);
      });

      test('リストを指定して初期化できる', () {
        final children = NodeChildren(children:[
          NodePath(path: [1, 2]),
          NodePath(path: [1, 3])
        ]);
        expect(children.children, equals([
          NodePath(path: [1, 2]),
          NodePath(path: [1, 3])
        ]));
      });
    });

    group('イミュータブル', () {
      NodeChildren nodeChildren = NodeChildren(children: []);
      test('配列に追加できないこと', () {
        expect(
          () => nodeChildren.children.add(
            NodePath(path: [1, 2]),
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

        //1つ
        NodeChildren nodeChildrenWithOneChild = NodeChildren(children: [
          NodePath(path: [1])
        ]);
        expect(nodeChildrenWithOneChild.children.length, equals(1));

        //2つ
        NodeChildren nodeChildrenWithTwoChildren = NodeChildren(children: [
          NodePath(path: [1]),
          NodePath(path: [2])
        ]);
        expect(nodeChildrenWithTwoChildren.children.length, equals(2));
      });
    });

    group('isEmpty / isNotEmpty', () {
      test('子ノードが空かどうかを判定できること', () {

        // 空
        NodeChildren emptyNodeChildren = NodeChildren(children: []);
        expect(emptyNodeChildren.children.isEmpty, isTrue);
        expect(emptyNodeChildren.children.isNotEmpty, isFalse);

        //空ではない
        NodeChildren nonEmptyNodeChildren = NodeChildren(children: [
          NodePath(path: [1])
        ]);
        expect(nonEmptyNodeChildren.children.isEmpty, isFalse);
        expect(nonEmptyNodeChildren.children.isNotEmpty, isTrue);
      });
    });

    group('freezed', () {
      test('copyWith:子ノードのリストを変更して新しいインスタンスを作成できること', () {

        NodeChildren originalNodeChildren = NodeChildren(children: [
          NodePath(path: [1]),
          NodePath(path: [2])
        ]);

        NodeChildren modifiedNodeChildren = originalNodeChildren.copyWith(
          children: [
            NodePath(path: [1]),
            NodePath(path: [2]),
            NodePath(path: [3])
          ],
        );

        expect(modifiedNodeChildren.children, equals([
          NodePath(path: [1]),
          NodePath(path: [2]),
          NodePath(path: [3])
        ]));

        expect(originalNodeChildren.children, equals([
          NodePath(path: [1]),
          NodePath(path: [2])
        ]));
      });

      test('==演算子:同じ内容のインスタンスは等しいこと', () {
        NodeChildren nodeChildrenA = NodeChildren(children: [
          NodePath(path: [1]),
          NodePath(path: [2])
        ]);

        NodeChildren nodeChildrenB = NodeChildren(children: [
          NodePath(path: [1]),
          NodePath(path: [2])
        ]);

        NodeChildren nodeChildrenC = NodeChildren(children: [
          NodePath(path: [1]),
          NodePath(path: [2]),
          NodePath(path: [3])
        ]);

        expect(nodeChildrenA, equals(nodeChildrenB));
        expect(nodeChildrenA, isNot(equals(nodeChildrenC)));
        
      });
    });
}
