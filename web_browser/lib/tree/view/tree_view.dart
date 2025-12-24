import 'package:flutter/material.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_view.dart';
import 'package:web_browser/tree/view/components/back_button/back_button.dart';

/// ツリー表示画面
/// 
/// coreディレクトリにある情報をもとに、ツリーを表示する画面
class TreeView extends StatelessWidget {
  const TreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // ツリーマップと戻るボタンを配置する
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