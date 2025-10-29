import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/browser_controller.dart';

class ParentNode extends ConsumerWidget {
  const ParentNode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    //状態の取得

    //TODO: 後ほど状態クラスを作成して統合する
    final bool isEmpty = false; // 仮の値
    final String parentName =
        "サグラダ・ファミリア"; // 仮の値。空になりうる。
    final Function() buttonAction = () {}; // 仮の値

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.onPrimaryContainer, width: 0.1),//上部は
          bottom: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
          left: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
          right: BorderSide(color: colorScheme.onPrimaryContainer, width: 1),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: !isEmpty
                ? () {
                    buttonAction();
                  }
                : null,
            style: IconButton.styleFrom(
              minimumSize: const Size(10, 10), // 高さを0に近づける
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 2,
              ), // 上下余白を0
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: colorScheme.onPrimary),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            icon: const Icon(Icons.arrow_upward),
          ),
      
          ParentNodeText(
            key: const Key('parentNodeText'),
            parentName: parentName,
            isEmpty: isEmpty,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}

class ParentNodeText extends StatelessWidget {
  const ParentNodeText({
    super.key,
    required this.parentName,
    required this.isEmpty,
    required this.colorScheme,
  });

  final String parentName;
  final bool isEmpty;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // 文字数に応じてフォントサイズを調整
          final int textLength = parentName.length;
          double fontSize = 14.0;
          int maxLines = 1;

          if (textLength > 20) {
            fontSize = 11.0;
          }
          if (textLength > 15) {
            fontSize = 12.0;
          }
          if (textLength > 30) {
            maxLines = 2;
          }

          return Text(
            parentName,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              color: isEmpty
                  ? colorScheme.onSurface.withOpacity(0.38)
                  : colorScheme.onSurface,
            ),
          );
        },
      ),
    );
  }
}
