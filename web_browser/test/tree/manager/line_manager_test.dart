import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/test.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/element_location_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/manager/line_manager.dart';
import 'package:web_browser/tree/model/element_location.dart';
import 'package:web_browser/tree/model/group_location.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';
import 'package:web_browser/tree/view/tree_settings.dart';

void main() {
  group('LineManager', () {
    late ProviderContainer testContainer;
    
    setUpAll(() {
      // テスト設定
      final Override settingOverride = treeSettingsProvider.overrideWithValue(
        TreeSettings(
          elementWidth: 100,
          elementPadding: 8,
          groupPadding: 20.0,
          layerHeight: 100.0,
          groupVerticalSpacing: 50.0,
          maxScale: 5.0,
          minScale: 0.1,
        ),
      );

      // テストケース用のモックデータ
      final testCases = [
        (
          NodePath.root,
          ElementLocation(x: 100, y: 0, centerX: 150, bottomY: 92),
          GroupLocation(x: 100, y: 100, centerX: 150, leftEdgeX: 120),
        ),
        (
          NodePath(path: [0]),
          ElementLocation(x: 20, y: 0, centerX: 70, bottomY: 92),
          GroupLocation(x: 30, y: 10, centerX: 80, leftEdgeX: 50),
        ),
        (
          NodePath(path: [0, 1]),
          ElementLocation(x: 30, y: 0, centerX: 80, bottomY: 92),
          GroupLocation(x: 10, y: 300, centerX: 60, leftEdgeX: 30),
        ),
      ];

      List<Override> overrides = [];

      for (var testCase in testCases) {
        final NodePath path = testCase.$1;
        final ElementLocation elementLocation = testCase.$2;
        final GroupLocation groupLocation = testCase.$3;

        // elementLocationManagerのオーバーライド
        overrides.add(
          elementLocationManagerProvider(path)
              .overrideWithValue(elementLocation),
        );

        // groupLocationManagerProviderのオーバーライド
        overrides.add(
          groupLocationManagerProvider(path)
              .overrideWithValue(groupLocation),
        );

        // childrenAtPathMangerProviderのオーバーライド
        // ルートノードのみ子を持つ
        if (path == NodePath.root) {
          overrides.add(
            childrenAtPathMangerProvider(path).overrideWithValue(
              NodeChildren(children: [NodePath(path: [0])]),
            ),
          );
        } else {
          overrides.add(
            childrenAtPathMangerProvider(path).overrideWithValue(
              NodeChildren(children: []),
            ),
          );
        }
      }

      testContainer = ProviderContainer(
        overrides: [...overrides, settingOverride],
      );
    });

    test('LineManagerが正しいOffsetを返す', () {
      // ルートノードのテスト（子を持つため線を引く）
      final rootOffsets = testContainer.read(lineManagerProvider(NodePath.root));
      expect(rootOffsets.$1, isA<Offset>(),
          reason: '開始点がOffsetである必要があります');
      expect(rootOffsets.$2, isA<Offset>(),
          reason: '終了点がOffsetである必要があります');

      // エレメント位置が centerX, bottomY - padding で計算されることを確認
      // elementPadding = 8なので、bottomY(92) - 8 = 84
      expect(rootOffsets.$1.dy, 84,
          reason: 'エレメントの開始点のY座標が正しく計算される必要があります');
      expect(rootOffsets.$1.dx, 150,
          reason: 'エレメントの開始点のX座標が centerX である必要があります');

      // グループ位置が centerX, y で計算されることを確認
      expect(rootOffsets.$2.dx, 150,
          reason: 'グループの終了点のX座標が centerX である必要があります');
      expect(rootOffsets.$2.dy, 100,
          reason: 'グループの終了点のY座標が y である必要があります');
    });

    test('子を持たないパスの場合、線は引かない', () {
      // グループ[0, 1]は子を持たないため Offset.zero を返す
      final offsets = testContainer.read(lineManagerProvider(NodePath(path: [0, 1])));
      expect(offsets, (Offset.zero, Offset.zero),
          reason: '子を持たないグループの場合、両方のオフセットが Offset.zero である必要があります');
    });
  });
}
