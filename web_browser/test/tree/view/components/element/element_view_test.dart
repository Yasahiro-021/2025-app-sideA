import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/view/components/element/element_state.dart';
import 'package:web_browser/tree/view/components/element/element_view.dart';
import 'package:web_browser/tree/view/components/element/element_view_model.dart';

void main() {
  group('ElementView', () {
    // 検証ケース（NodePath, 位置(x,y), タイトル）
    final cases = <(NodePath, (double, double), String)>[
      (NodePath.root, (0, 0), 'title-0'),
      (NodePath(path: [0]), (1, 1), 'title-1'),
      (NodePath(path: [0, 1]), (2, 2), 'title-2'),
      (NodePath(path: [0, 1, 2]), (3, 3), 'title-3'),
    ];

    // すべてのケース分のProvider上書きを用意する
    final overrides = cases
        .map((c) => elementViewModelProvider(c.$1).overrideWithValue(
              ElementState(title: c.$3, position: c.$2),
            ))
        .toList();

    testWidgets('タイトルと位置が正しく表示される', (WidgetTester tester) async {
      for (final c in cases) {
        // ProviderScopeでViewModelを差し替え、Stack配下でPositionedを正しく配置する
        await tester.pumpWidget(
          ProviderScope(
            overrides: overrides,
            child: MaterialApp(
              home: Scaffold(
                body: Stack(
                  children: [
                    ElementView(nodePath: c.$1),
                  ],
                ),
              ),
            ),
          ),
        );

        // タイトル表示確認
        expect(find.text(c.$3), findsOneWidget);

        // 位置（left, top）が状態どおりか確認
        final positioned = tester.widget<Positioned>(find.byType(Positioned));
        expect(positioned.left, equals(c.$2.$1));
        expect(positioned.top, equals(c.$2.$2));
      }
    });
  });
}
