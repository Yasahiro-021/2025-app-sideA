import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/app_bar/parent_node/parent_node_viewmodel.dart';

/// 親ノード表示・遷移ボタン
class ParentNodeView extends ConsumerWidget {
  const ParentNodeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final viewModel = ref.watch(parentNodeViewModelProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.onPrimaryContainer, width: 0.1),
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
            onPressed: viewModel.hasParent
                ? () {
                    viewModel.navigateToParent();
                  }
                : null,
            style: IconButton.styleFrom(
              minimumSize: const Size(10, 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 2,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: colorScheme.onPrimary),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            icon: const Icon(Icons.arrow_upward),
          ),
          _ParentNodeText(
            key: const Key('parentNodeText'),
            parentName: viewModel.parentName,
            isEmpty: !viewModel.hasParent,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }
}

/// 親ノード名表示テキスト
class _ParentNodeText extends StatelessWidget {
  const _ParentNodeText({
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
            isEmpty ? '親なし' : parentName,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              color: isEmpty
                  ? colorScheme.onSurface.withOpacity(0.5)
                  : colorScheme.onSurface,
            ),
          );
        },
      ),
    );
  }
}
