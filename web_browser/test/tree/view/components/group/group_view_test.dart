import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group.dart';

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
    );
    //NodePathごとにGroupデータ、位置データを用意
    final Map<NodePath, (Group, (double, double))> testCases = {
      NodePath.root: (
        Group(
          width: 200.0,
          path: NodePath.root,
          elements: [],
          childrenGroup: [],
          treeWidth: 0,
        ),
        (50.0, 75.0),
      ),
      NodePath(path: [0]): (
        Group(
          width: 150.0,
          path: NodePath(path: [0]),
          elements: [],
          childrenGroup: [],
          treeWidth: 0,
        ),
        (100.0, 150.0),
      ),
      NodePath(path: [0, 1]): (
        Group(
          width: 250.0,
          path: NodePath(path: [0, 1]),
          elements: [],
          childrenGroup: [],
          treeWidth: 0,
        ),
        (200.0, 300.0),
      ),
    };
    //テスト環境で使用するプロバイダのオーバーライドたち
    List<Override> overrides = [];
    setUpAll(() {
      //各テストケースに対してのオーバライドを作成
      testCases.forEach((nodePath, data) {
        final groupData = data.$1;
        final positionData = data.$2;
        // groupManagerProviderのオーバーライド
        overrides.add(
          groupManagerProvider(nodePath).overrideWithValue(groupData),
        );
        // groupLocationManagerProviderのオーバーライド
        overrides.add(
          groupLocationManagerProvider(
            nodePath,
          ).overrideWithValue(positionData),
        );
      });

      // treeSettingsProviderのオーバーライド
      overrides.add(
        treeSettingsProvider.overrideWithValue(treeSettingsData),
      );
    });
    testWidgets('位置が正しいか', (WidgetTester tester) async {
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
        expect(positionedFinder, findsOneWidget);
        final positionedWidget = tester.widget<Positioned>(positionedFinder);
        //位置の検証
        expect(positionedWidget.left, equals(expectedPosition.$1));
        expect(positionedWidget.top, equals(expectedPosition.$2));
      }
    });
    testWidgets('表示内容が正しいか', (WidgetTester tester) async {
      for (final entry in testCases.entries) {
        final nodePath = entry.key;
        final groupData = entry.value.$1;
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
        expect(find.text('Group: $nodePath'), findsOneWidget);
        final containerFinder = find.descendant(
          of: find.byType(GroupView),
          matching: find.byType(Container),
        );
        expect(containerFinder, findsOneWidget);
        final containerWidgetSize = tester.getSize(containerFinder);
        expect(containerWidgetSize.width, equals(groupData.width));
      }
    });
  });
}
