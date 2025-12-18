import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/test.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';

import '../test_tools/mockChildrenAtPath.dart';

void main() {
  group('GroupLocationManager', () {
    final List<(NodePath, int)> createChildCount = [
      (NodePath.root, 3), // ルートに3つの子ノード
      //rootのGroup
      (NodePath(path: [0]), 2), //[0]に2つの子ノード
      (NodePath(path: [1]), 3), //[1]に3つの子ノード
      (NodePath(path: [2]), 1), //[2]に1つの子ノード
      // 3 * 2 + 2 + 3 + 1 = 12　がrootのtreeWidth
      (NodePath(path: [0, 0]), 1), //[0,0]に1個の子ノード
      // ※rootのグループのtreeWidthは変わらない
      (NodePath(path: [0, 1]), 10), //[0,1]に10個の子ノード
    ];
    late final ProviderContainer testContainer;
    setUpAll(() {
      final List<Override> childrenAtPathOverrides = mockChildrenAtPath(
        createChildCount,
      );
      testContainer = ProviderContainer.test(
        overrides: [...childrenAtPathOverrides],
      );
    });
    test('rootの子を正しく計算できるか', () {
      //テスト対象
      final (double, double) rootChildrenPosition = testContainer.read(
        groupLocationManagerProvider(NodePath.root),
      );

      //期待値確認
      double rootChildrenTreeWidth = testContainer
          .read(groupManagerProvider(NodePath.root))
          .treeWidth;

      log(
        "rootChildrenTreeWidth: $rootChildrenTreeWidth center is ${rootChildrenTreeWidth / 2}",
      );

      //0になっていないか確認
      expect(rootChildrenPosition.$1 >= 0, true);

      //中央に位置しているか確認
      log("rootChildrenPosition: $rootChildrenPosition");
      expect(rootChildrenPosition.$1, rootChildrenTreeWidth / 2);
    });

    test('depth2のグループが正しく計算できるか', () {
      //テスト対象
      final List<NodePath> paths = [
        NodePath(path: [0]),
        NodePath(path: [1]),
        NodePath(path: [2]),
      ];
      final List<(double, double)> groupLocates = paths
          .map((path) => testContainer.read(groupLocationManagerProvider(path)))
          .toList();

      //期待値確認
      List<double> groupTreeWidths = paths
          .map(
            (path) => testContainer.read(groupManagerProvider(path)).treeWidth,
          )
          .toList();

      int childnum = 0;
      for (double groupTreeWidth in groupTreeWidths) {
        log(
          "index $childnum width: $groupTreeWidth center is ${groupTreeWidth / 2}",
        );
        childnum++;
      }

      //対象の値が0になっていないか確認
      expect(groupLocates.every((locate) => locate.$1 >= 0), true);

      //幅の合計値を出力
      double expectTotalWidth = 0;
      for (double width in groupTreeWidths) {
        expectTotalWidth += width;
      }

      log("expectTotalWidth: $expectTotalWidth");

      //中央に位置しているか確認
      double sumWidth = 0;

      log("groupLocates: $groupLocates");
      for (int i = 0; i < groupLocates.length; i++) {
        log("now index $i: ${groupLocates[i]} sumWidth: $sumWidth");
        expect(groupLocates[i].$1, groupTreeWidths[i] / 2 + sumWidth);
        sumWidth += groupTreeWidths[i];
      }
      log('sumWidth: $sumWidth');
      expect(sumWidth, expectTotalWidth);
    });

    test('depth3のグループが正しく計算できるか', () {
      //テスト対象
      final List<NodePath> paths = [
        NodePath(path: [0, 0]),
        NodePath(path: [0, 1]),
      ];
      final List<(double, double)> groupLocates = paths
          .map((path) => testContainer.read(groupLocationManagerProvider(path)))
          .toList();

      //期待値確認
      List<double> groupTreeWidths = paths
          .map(
            (path) => testContainer.read(groupManagerProvider(path)).treeWidth,
          )
          .toList();

      int childnum = 0;
      for (double groupTreeWidth in groupTreeWidths) {
        log(
          "index $childnum width: $groupTreeWidth center is ${groupTreeWidth / 2}",
        );
        childnum++;
      }

      //対象の値が0になっていないか確認
      expect(groupLocates.every((locate) => locate.$1 >= 0), true);

      //幅の合計値を出力
      double expectTotalWidth = 0;
      for (double width in groupTreeWidths) {
        expectTotalWidth += width;
      }

      log("expectTotalWidth: $expectTotalWidth");

      //中央に位置しているか確認
      double sumWidth = 0;

      log("groupLocates: $groupLocates");
      for (int i = 0; i < groupLocates.length; i++) {
        log("now index $i: ${groupLocates[i]} sumWidth: $sumWidth");
        expect(groupLocates[i].$1, groupTreeWidths[i] / 2 + sumWidth);
        sumWidth += groupTreeWidths[i];
      }
      log('sumWidth: $sumWidth');
      expect(sumWidth, expectTotalWidth);
    });
  });
}
