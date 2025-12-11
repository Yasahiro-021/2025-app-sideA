import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/core/node/node_path.dart';

void main() {
  group('NodePath', () {
    group('コンストラクタ', () {
      NodePath nodePath;
      test('正常なパスで初期化できること', () {
        nodePath = NodePath(path: [0, 1, 2]);
        expect(nodePath, isA<NodePath>());
      });

      test('不正なパスで初期化できないこと', () {
        //パスにマイナス値
        expect(
          () => NodePath(path: [-1, 2, 3]),
          throwsA(isA<FormatException>()),
        );
        expect(
          () => NodePath(path: [0, -2, 3]),
          throwsA(isA<FormatException>()),
        );
        expect(
          () => NodePath(path: [0, 2, -3]),
          throwsA(isA<FormatException>()),
        );
      });

      group('パス操作', () {
        test('親のパスを作成できること', () {
          NodePath path = NodePath(path: [0, 1, 2, 3]);
          NodePath expectedParentPath = NodePath(path: [0, 1, 2]);

          expect(path.parentPath, expectedParentPath);
        });

        test('ルートパスの親はnullであること', () {
          NodePath rootPath = NodePath(path: []);
          expect(rootPath.parentPath, isNull);
        });

        test('インデックスから子パスを作成できること', () {
          NodePath path = NodePath(path: [0, 1, 2]);
          NodePath expectedChildPath = NodePath(path: [0, 1, 2, 3]);

          expect(path.createChildPath(3), expectedChildPath);
        });

        test('パスの深さを返せること', () {
          //通常のパス
          NodePath path = NodePath(path: [0, 1, 2, 3, 4]);
          expect(path.depth, 5);

          //ルートパス
          NodePath rootPath = NodePath(path: []);
          expect(rootPath.depth, 0);
        });
      });

      group('比較・判定', () {
        test('同じパスの場合はtrueを返すこと', () {
          NodePath path1 = NodePath(path: [0, 1, 2]);
          NodePath path2 = NodePath(path: [0, 1, 2]);
          expect(path1 == path2, isTrue);
        });

        test('異なるパスの場合はfalseを返すこと', () {
          NodePath path1 = NodePath(path: [0, 1, 2]);
          NodePath path2 = NodePath(path: [0, 1, 3]);
          expect(path1 == path2, isFalse);
        });

        test('親子関係を正しく判定できること', () {
          NodePath parentPath = NodePath(path: [0, 1]);
          NodePath childPath = NodePath(path: [0, 1, 2]);

          expect(parentPath.isParentOf(childPath), isTrue);
          expect(childPath.isChildOf(parentPath), isTrue);

          NodePath unrelatedPath = NodePath(path: [1, 2]);
          expect(parentPath.isParentOf(unrelatedPath), isFalse);
          expect(unrelatedPath.isChildOf(parentPath), isFalse);
        });
      });

      group('文字列変換', () {
        test('パスを文字列に変換できること', () {
          NodePath path = NodePath(path: [0, 1, 2, 3]);

          //通常パス
          expect(path.toString(), '/0/1/2/3');

          //ルートパス
          NodePath rootPath = NodePath(path: []);
          expect(rootPath.toString(), '/');
        });

        test('文字列からパスを復元できること', () {
          String pathString = '/0/1/2/3';
          NodePath expectedPath = NodePath(path: [0, 1, 2, 3]);

          expect(NodePath.fromString(pathString), expectedPath);
        });
      });

      group('エッジケース', () {
        test('深いネストのパスを処理できること', () {
          NodePath deepPath = NodePath(
            path: List.generate(1000, (index) => index),
          );
          expect(deepPath.depth, 1000);
        });
      });
    });
  });
}
