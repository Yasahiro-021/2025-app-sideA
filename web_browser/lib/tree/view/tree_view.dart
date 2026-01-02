import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_view.dart';
import 'package:web_browser/tree/view/components/back_button/back_button.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';
import 'package:web_browser/tree/view/tree_settings.dart';

/// ツリー表示画面
///
/// coreディレクトリにある情報をもとに、ツリーを表示する画面
class TreeView extends ConsumerWidget {
  const TreeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // レイアウトの設定を読み込み
    final TreeSettings settings = ref.watch(treeSettingsProvider);
    final scheme = Theme.of(context).colorScheme;
    // ツリーマップと戻るボタンを配置する
    return Stack(
      children: [
        //インタラクティブの中にツリーマップを配置
        Container(
          color: scheme.surface,
          child: InteractiveViewer(
            constrained: false,
            boundaryMargin: const EdgeInsets.all(600),
            minScale: settings.minScale,
            maxScale: settings.maxScale,
            panEnabled: true,
            scaleEnabled: true,
            child: TreeMapView(),
          ),
        ),
        //戻るボタン
        Positioned(top: 16, left: 16, child: TreeBackButton()),
      ],
    );
  }
}
