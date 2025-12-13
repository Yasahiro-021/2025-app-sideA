import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// ツリー画面から戻るためのボタン
class TreeBackButton extends StatelessWidget {
  const TreeBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () => context.pop(),
      child: const Icon(Icons.arrow_back),
    );
  }
}
