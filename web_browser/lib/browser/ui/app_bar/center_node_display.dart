import 'package:flutter/material.dart';
import 'package:web_browser/browser/ui/app_bar/parent_node.dart';
import 'package:web_browser/browser/ui/app_bar/current_node_text.dart';

class CenterNodeDisplay extends StatelessWidget {
  const CenterNodeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        ParentNode(),
        SizedBox(
          height: 1,
          child: VerticalDivider(
            thickness: 1,
            width: 20,
          ),
        ),
        CurrentNodeText(),
      ],
    );
  }
}
