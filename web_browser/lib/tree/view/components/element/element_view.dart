import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/view/components/element/element_state.dart';
import 'package:web_browser/tree/view/components/element/element_view_model.dart';

class ElementView extends ConsumerWidget {
  const ElementView({super.key, required this.nodePath});
  final NodePath nodePath;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ElementState state = ref.watch(elementViewModelProvider(nodePath));
    return Positioned(
      // 描画場所
      top: state.position.$2,
      left: state.position.$1,
      // ノード
      child: Container(
        width: 100,
        height: 50,
        color: Colors.blue,
        child: Center(
          // ノードのタイトル
          child: Text(state.title, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
