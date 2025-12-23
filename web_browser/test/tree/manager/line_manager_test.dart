import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/test.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/element_location_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/manager/line_manager.dart';

void main() {
  group('LineManager', () {
    List<(NodePath, (double, double), (double, double))> testCases = [
      // (NodePath, (elementの位置), (groupの位置))
      (NodePath.root, (100, 0), (100, 100)),
      (NodePath(path: [0]), (20, 0), (30, 10)),
      (NodePath(path: [0, 1]), (30, 0), (10, 300)),
    ];

    late ProviderContainer testContainer;
    setUpAll(() {
      // 依存関係のオーバライド
      List<Override> elementLocationOverrides = [];
      List<Override> groupLocationOverrides = [];
      for (var testCase in testCases) {
        NodePath path = testCase.$1;
        (double, double) elementLocation = testCase.$2;
        (double, double) groupLocation = testCase.$3;

        // elementLocationManagerのオーバーライド
        elementLocationOverrides.add(
          elementLocationManagerProvider(
            path,
          ).overrideWithValue(elementLocation),
        );

        // groupLocationManagerProviderのオーバーライド
        groupLocationOverrides.add(
          groupLocationManagerProvider(path).overrideWithValue(groupLocation),
        );
      }
      // ProviderContainerの作成
      testContainer = ProviderContainer.test(
        overrides: [...elementLocationOverrides, ...groupLocationOverrides],
      );
    });
    test('正しいOffsetを返す', () {
      for (var testCase in testCases) {
        NodePath path = testCase.$1;
        (double, double) elementLocation = testCase.$2;
        (double, double) groupLocation = testCase.$3;

        final offsets = testContainer.read(lineManagerProvider(path));
        expect(offsets, (
          Offset(elementLocation.$1, elementLocation.$2),
          Offset(groupLocation.$1, groupLocation.$2),
        ));
      }
    });
  });
}
