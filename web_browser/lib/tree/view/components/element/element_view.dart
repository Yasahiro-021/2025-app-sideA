import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/view/components/element/element_state.dart';
import 'package:web_browser/tree/view/components/element/element_view_model.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

class ElementView extends ConsumerWidget {
  const ElementView({super.key, required this.nodePath});
  final NodePath nodePath;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ElementState state = ref.watch(elementViewModelProvider(nodePath));

    //スキームを取得
    final scheme = Theme.of(context).colorScheme;

    //設定を取得
    final settings = ref.watch(treeSettingsProvider);
    
    return Positioned(
      // 描画場所
      top: state.position.$2,
      left: state.position.$1,
      // ノード
      child: SizedBox(
          width: settings.elementWidth,
          height: settings.layerHeight,
        child: Padding(
          padding: EdgeInsets.all(settings.elementPadding),
          child: Container(
            color: scheme.primary,
            child: FittedBox(
              child: Text(
                state.title,
                style: TextStyle(color: scheme.onPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
