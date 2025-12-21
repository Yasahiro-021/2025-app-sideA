import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/view/components/element/element_state.dart';
import 'package:web_browser/tree/view/components/element/element_view_model.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

// モックのGroupLocationManager
class MockGroupLocationManager extends GroupLocationManager {
  final (double, double) _value;
  MockGroupLocationManager(this._value);

  @override
  (double, double) build(NodePath parentPath) => _value;

  @override
  (double, double) get leftEdgePos => _value;
}

void main() {
  group('ElementViewModel Test', () {
    final cases = [
      (NodePath.root, (10.0, 10.0), 'Root Node'), //　ルートノードとグループ
      (NodePath(path: [0]), (20.0, 20.0), 'ChildNode 0'), //
      (NodePath(path: [0, 0]), (30.0, 30.0), 'ChildNode 1'), //
      (NodePath(path: [0, 0, 2]), (40.0, 40.0), 'ChildNode 2'), //
    ];
    late ProviderContainer testContainer;

    setUp(() {
      // 各ケースに対して、GroupLocationManagerとBrowserNodeManagerとChildrenAtPathManagerのモックを作成
      // Overrideリストを作成
      List<Override> groupLocationManagerOverrides =
          []; //エレメントが所属するグループの位置の取得に使用
      List<Override> browserNodeManagerOverrides = []; //表示するタイトルの取得に使用
      List<Override> childrenAtPathManagerOverrides = []; //自身のindexの取得に使用
      for (var c in cases) {
        // グループ位置のモックデータを登録
        groupLocationManagerOverrides.add(
          groupLocationManagerProvider(
            c.$1,
          ).overrideWith(() => MockGroupLocationManager(c.$2)),
        );
        // タイトル用のモックデータを登録
        browserNodeManagerOverrides.add(
          browserNodeFromPathProvider(
            c.$1,
          ).overrideWithValue(BrowserNode(title: c.$3, url: 'url/${c.$1}')),
        );
        //ルートノードの場合は親がいないのでスキップ
        final parentPath = c.$1.parentPath;
        if (parentPath == null) {
          continue;
        }
        childrenAtPathManagerOverrides.add(
          childrenAtPathMangerProvider(parentPath).overrideWithValue(
            NodeChildren(
              children: [
                for (int i = 0; i < c.$1.path.last; i++)
                  //ケースのパスまでを埋めるダミーノード
                  NodePath(path: [...parentPath.path, i]),
                c.$1, // テスト対象のNodePath
              ],
            ),
          ),
        );
      }
      testContainer = ProviderContainer.test(
        overrides: [
          ...groupLocationManagerOverrides,
          ...browserNodeManagerOverrides,
          ...childrenAtPathManagerOverrides,
        ],
      );
    });
    test('ルートが正しく値を返す', () {
      final ElementState tgt = testContainer.read(
        elementViewModelProvider(NodePath.root),
      );
      final ElementState expectedState = ElementState(
        title: 'Root Node',
        position: (10.0, 0), //ルートグループの直上に配置されている
      );
      expect(tgt, expectedState);
    });
    test('ルート以外のグループが正しい値を返す（ルートを含めるとヌルポ）', () {
      final tgts = cases.where((c) => c.$1 != NodePath.root).map((c) {
        return (testContainer.read(elementViewModelProvider(c.$1)));
      }).toList();

      // 期待されるStateを作成
      // elementWidthとelementPaddingとgroupPaddingを取得
      double elementWidth = testContainer
          .read(treeSettingsProvider)
          .elementWidth;
      double elementPadding = testContainer
          .read(treeSettingsProvider)
          .elementHorizontalSpacing;
      double groupPadding = testContainer
          .read(treeSettingsProvider)
          .groupPadding;

      //親の開始位置を返す関数を作成
      double parentLocationGetter(NodePath path) {
        return testContainer
            .read(groupLocationManagerProvider(path.parentPath!).notifier)
            .leftEdgePos
            .$1;
      }
      final List<ElementState> expectedStates = cases
          .where((c) => c.$1 != NodePath.root)
          .map(
            (c) => ElementState(
              title: c.$3,
              position: (
                parentLocationGetter(c.$1) +
                    groupPadding +
                    elementWidth / 2 +
                    (elementWidth + elementPadding) * c.$1.path.last, // x座標
                NodePath(path: c.$1.path).depth.toDouble(),
              ),
            ),
          )
          .toList();
      expect(tgts, expectedStates);
    });
  });
}
