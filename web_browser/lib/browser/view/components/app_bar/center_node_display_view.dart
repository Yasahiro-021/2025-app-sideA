import 'package:flutter/material.dart';
import 'package:web_browser/browser/view/components/app_bar/parent_node/parent_node_view.dart';
import 'package:web_browser/browser/view/components/app_bar/current_node_text/current_node_text_view.dart';

/// AppBarの中央部分にノード情報を表示
class CenterNodeDisplayView extends StatelessWidget {
  const CenterNodeDisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ParentNodeView(),
        SizedBox(
          height: 10,
          child: VerticalDivider(
            thickness: 15,
          ),
        ),
        CurrentNodeTextView(),
      ],
    );
  }
}
