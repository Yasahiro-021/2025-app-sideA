import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/element_location_manager.dart';
import 'package:web_browser/tree/model/element_location.dart';
import 'package:web_browser/tree/view/components/element/element_view_model.dart';

void main() {
  group('ElementViewModel Test', () {
    final testCases = [
      (
        NodePath.root,
        ElementLocation(x: 10.0, y: 0.0, centerX: 60.0, bottomY: 92.0),
        'Root Node'
      ),
      (
        NodePath(path: [0]),
        ElementLocation(x: 20.0, y: 0.0, centerX: 70.0, bottomY: 92.0),
        'Child Node 0'
      ),
      (
        NodePath(path: [0, 0]),
        ElementLocation(x: 30.0, y: 0.0, centerX: 80.0, bottomY: 92.0),
        'Child Node 1'
      ),
      (
        NodePath(path: [0, 0, 2]),
        ElementLocation(x: 40.0, y: 0.0, centerX: 90.0, bottomY: 92.0),
        'Child Node 2'
      ),
    ];

    late ProviderContainer testContainer;

    setUp(() {
      // 各テストケースに対してのオーバーライドを作成
      List<Override> overrides = [];
      
      for (var testCase in testCases) {
        final nodePath = testCase.$1;
        final elementLocation = testCase.$2;
        final title = testCase.$3;

        // elementLocationManagerProviderのオーバーライド
        overrides.add(
          elementLocationManagerProvider(nodePath)
              .overrideWithValue(elementLocation),
        );

        // browserNodeFromPathProviderのオーバーライド
        overrides.add(
          browserNodeFromPathProvider(nodePath).overrideWithValue(
            BrowserNode(title: title, url: 'url/$nodePath'),
          ),
        );
      }

      testContainer = ProviderContainer(overrides: overrides);
    });

    test('ルートノードが正しく値を返す', () {
      final tgt = testContainer.read(
        elementViewModelProvider(NodePath.root),
      );
      expect(tgt.title, 'Root Node',
          reason: 'タイトルが正しく取得される必要があります');
      expect(tgt.position, (10.0, 0.0),
          reason: 'ルートノードの位置が正しい必要があります');
    });

    test('ルート以外のノードが正しい値を返す', () {
      final testPaths = [
        NodePath(path: [0]),
        NodePath(path: [0, 0]),
        NodePath(path: [0, 0, 2]),
      ];

      for (final path in testPaths) {
        final tgt = testContainer.read(
          elementViewModelProvider(path),
        );

        // 期待値を取得
        final expectedCase = testCases.firstWhere((c) => c.$1 == path);
        expect(tgt.title, expectedCase.$3,
            reason: 'ノード$pathのタイトルが正しい必要があります');
        expect(
          tgt.position,
          (expectedCase.$2.x, expectedCase.$2.y),
          reason: 'ノード$pathの位置が正しい必要があります',
        );
      }
    });
  });
}
