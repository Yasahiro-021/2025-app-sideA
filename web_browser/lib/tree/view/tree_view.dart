import 'package:flutter/material.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_view.dart';
import 'package:web_browser/tree/view/components/back_button/back_button.dart';

/// ツリー表示画面
/// 
/// DBから取得したノードデータをツリー形式で表示します。
/// ChildrenAtPathMangerProviderを通じてデータを取得するため、
/// 引数は不要です。
class TreeView extends StatelessWidget {
  const TreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        TreeMapView(),
        Positioned(
          top: 16,
          left: 16,
          child: TreeBackButton(),
        ),
      ],
    );
  }
}