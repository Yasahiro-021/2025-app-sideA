import 'package:hooks_riverpod/misc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/test.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/core/usecase/create_node_usecase.dart';
import 'package:web_browser/tree/usecase/compare_priority_usecase.dart';

void main() {
  group("正しく優先度を比較できるか", () {
    late ProviderContainer container;

    late NodePath rootPath;
    late NodeChildren firstLayer;
    late NodeChildren secondLayer_0;
    late NodeChildren secondLayer_1;

    setUp(() {
      container = ProviderContainer();
      //ノードツリーの作成

      rootPath = NodePath(path: []);

      //第一階層ノードを3つ作成
      for (int i = 0; i < 3; i++) {
        container
            .read(createNodeUsecaseProvider.notifier)
            .create(parentPath: rootPath);
      }

      //第二階層ノード、path:[0]の子として2つ作成
      for (int i = 0; i < 2; i++) {
        container
            .read(createNodeUsecaseProvider.notifier)
            .create(parentPath: NodePath(path: [0]));
      }

      //第二階層ノード、path:[1]の子として5つ作成
      for (int i = 0; i < 5; i++) {
        container
            .read(createNodeUsecaseProvider.notifier)
            .create(parentPath: NodePath(path: [1]));
      }
      //第三階層ノード、path:[2]の子として3つ作成
      for (int i = 0; i < 3; i++) {
        container
            .read(createNodeUsecaseProvider.notifier)
            .create(parentPath: NodePath(path: [2]));
      }

      //テスト対象をセット。
      firstLayer = container.read(childrenAtPathMangerProvider(rootPath));

      secondLayer_0 = container.read(
        childrenAtPathMangerProvider(NodePath(path: [0])),
      );

      secondLayer_1 = container.read(
        childrenAtPathMangerProvider(NodePath(path: [1])),
      );
    });
    tearDown(() {
      container.dispose();
    });

    test("第1階層(奇数)で1を返せる", () {
      int result = container.read(
        comparePriorityUsecaseProvider(
          NodePath(path: [1]),
          NodePath(path: [0]),
        ),
      );

      expect(result, 1);
    });
    test("第1階層(奇数)で優先度が低い場合-1を返せる", () {
      int result = container.read(
        comparePriorityUsecaseProvider(
          NodePath(path: [0]),
          NodePath(path: [1]),
        ),
      );

      expect(result, -1);
    });
    test("第1階層(奇数)で同値の場合0を返せる", () {
      int result1 = container.read(
        comparePriorityUsecaseProvider(
          NodePath(path: [0]),
          NodePath(path: [0]),
        ),
      );

      //第1階層のノード数は３のため、中央は1。よって[0]と[2]は同優先度。
      int result2 = container.read(
        comparePriorityUsecaseProvider(
          NodePath(path: [0]),
          NodePath(path: [2]),
        ),
      );

      expect(result1, 0);
      expect(result2, 0);
    });
    test("第2階層(偶数)で0を返せる", () {
      int result = container.read(
        //firstLayerのpath:[0]の子ノードは2つ。よって同優先度
        comparePriorityUsecaseProvider(
          NodePath(path: [0, 1]),
          NodePath(path: [0, 0]),
        ),
      );

      expect(result, 0);
    });
    test("第2階層(奇数)で1を返せる", () {
      int result = container.read(
        //secondLayer_1の子ノードは5つ。よって中央は2。path:[1,2]が最も中央に近い。
        comparePriorityUsecaseProvider(
          NodePath(path: [1, 2]),
          NodePath(path: [1, 0]),
        ),
      );

      expect(result, 1);
    });
    test("第2階層の(奇数)で-1と0を返せる", () {
      int result1 = container.read(
        comparePriorityUsecaseProvider(
          NodePath(path: [1, 0]),
          NodePath(path: [1, 2]),
        ),
      );
      int result2 = container.read(
        //同優先度
        comparePriorityUsecaseProvider(
          NodePath(path: [1, 0]),
          NodePath(path: [1, 4]),
        ),
      );

      expect(result1, -1);
      expect(result2, 0);
    });
    test("親が異なる場合で1を返せる", () {
      int result = container.read(
        comparePriorityUsecaseProvider(
          NodePath(path: [2, 1]),
          NodePath(path: [0, 1]),
        ),
      );

      ///path[0,1]の親であるpath[0]の優先度は1、path[2,0]の親であるpath[2]の優先度は1。
      ///よって同優先度となり、次の階層で比較を行う。
      ///path[0,1]の優先度は0.5、path[2,1]の優先度は0。
      expect(result, 1);
    });
    test("親が異なる場合で-1を返せる", () {
      int result2 = container.read(
        comparePriorityUsecaseProvider(
          NodePath(path: [2, 0]),
          NodePath(path: [0, 1]),
        ),
      );
      expect(result2, -1);
    });
    test("深さが異なる場合、StateErrorを投げる", () {
      expect(
        () => container.read(
          comparePriorityUsecaseProvider(
            NodePath(path: [0]),
            NodePath(path: [0, 0]),
          ),
        ),
        throwsA(
          isA<ProviderException>().having(
            (e) => e.exception,
            "exception",
            isA<StateError>(),
          ),
        ),
      );
    });
  });
}
