import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group.dart';
import 'package:web_browser/tree/model/group_location.dart';
//テスト対象
import 'package:web_browser/tree/view/components/group/group_view.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';
import 'package:web_browser/tree/view/tree_settings.dart';

void main() {
  group('groupView', () {
    //テストケースの定義
    //全体のツリー設定
    final TreeSettings treeSettingsData = TreeSettings(
      layerHeight: 50.0,
      groupPadding: 8.0,
      groupVerticalSpacing: 20.0,
      elementWidth: 100,
      elementPadding: 8,
      maxScale: 5.0,
      minScale: 0.1,
    );
    //NodePathごとにGroupデータ、位置データを用意
    final Map<NodePath, (Group, GroupLocation)> testCases = {
      NodePath.root: (
        Group(
          width: 200.0,
          path: NodePath.root,
          elements: [],
          childrenGroup: [],
          treeWidth: 200.0,
        ),
        GroupLocation(x: 50.0, y: 75.0, centerX: 150.0, leftEdgeX: 58.0),
      ),
      NodePath(path: [0]): (
        Group(
          width: 150.0,
          path: NodePath(path: [0]),
          elements: [],
          childrenGroup: [],
          treeWidth: 150.0,
        ),
        GroupLocation(x: 100.0, y: 150.0, centerX: 175.0, leftEdgeX: 108.0),
      ),
      NodePath(path: [0, 1]): (
        Group(
          width: 250.0,
          path: NodePath(path: [0, 1]),
          elements: [],
          childrenGroup: [],
          treeWidth: 250.0,
        ),
        GroupLocation(x: 200.0, y: 300.0, centerX: 325.0, leftEdgeX: 208.0),
      ),
    };
    //テスト環境で使用するプロバイダのオーバーライドたち
    
    setUpAll(() {
      // オーバーライドは各テストで個別に作成する
    });

    testWidgets('位置が正しいか', (WidgetTester tester) async {
      // 各テストケースのオーバーライドを作成
      final overrides = testCases.entries
          .expand((entry) {
            final nodePath = entry.key;
            final groupData = entry.value.$1;
            final locationData = entry.value.$2;
            return [
              groupManagerProvider(nodePath).overrideWithValue(groupData),
              groupLocationManagerProvider(nodePath)
                  .overrideWithValue(locationData),
            ];
          })
          .toList()
        ..add(treeSettingsProvider.overrideWithValue(treeSettingsData));

      for (final entry in testCases.entries) {
        final nodePath = entry.key;
        final expectedPosition = entry.value.$2;
        //ウィジェットの描画
        await tester.pumpWidget(
          ProviderScope(
            overrides: overrides,
            child: MaterialApp(
              home: Scaffold(
                body: Stack(children: [GroupView(nodePath: nodePath)]),
              ),
            ),
          ),
        );
        //Positionedウィジェットの取得
        final positionedFinder = find.byType(Positioned);
        expect(positionedFinder, findsOneWidget,
            reason: 'GroupViewがPositionedでラップされている必要があります');
        final positionedWidget = tester.widget<Positioned>(positionedFinder);
        //位置の検証
        expect(positionedWidget.left, equals(expectedPosition.x),
            reason: 'グループのX座標が正しい必要があります');
        expect(positionedWidget.top, equals(expectedPosition.y),
            reason: 'グループのY座標が正しい必要があります');
      }
    });

    testWidgets('表示内容が正しいか', (WidgetTester tester) async {
      // 各テストケースのオーバーライドを作成
      final overrides = testCases.entries
          .expand((entry) {
            final nodePath = entry.key;
            final groupData = entry.value.$1;
            final locationData = entry.value.$2;
            return [
              groupManagerProvider(nodePath).overrideWithValue(groupData),
              groupLocationManagerProvider(nodePath)
                  .overrideWithValue(locationData),
            ];
          })
          .toList()
        ..add(treeSettingsProvider.overrideWithValue(treeSettingsData));

      for (final entry in testCases.entries) {
        final nodePath = entry.key;
        final groupData = entry.value.$1;
        final padding = treeSettingsData.groupPadding;
        //ウィジェットの描画
        await tester.pumpWidget(
          ProviderScope(
            overrides: overrides,
            child: MaterialApp(
              home: Scaffold(
                body: Stack(children: [GroupView(nodePath: nodePath)]),
              ),
            ),
          ),
        );
        //表示内容の検証
        expect(find.text('Group: $nodePath'), findsOneWidget,
            reason: 'グループのタイトルが表示される必要があります');
        final containerFinder = find.descendant(
          of: find.byType(GroupView),
          matching: find.byType(Container),
        );
        expect(containerFinder, findsOneWidget,
            reason: 'グループがコンテナでラップされている必要があります');
        final containerWidgetSize = tester.getSize(containerFinder);
        // 幅は width - padding * 2
        final expectedWidth = groupData.width - padding * 2;
        expect(containerWidgetSize.width, equals(expectedWidth),
            reason: 'コンテナの幅がパディングを考慮した値である必要があります');
      }
    });
  });
}
