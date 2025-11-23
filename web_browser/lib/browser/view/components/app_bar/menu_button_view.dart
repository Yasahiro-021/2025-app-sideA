import 'package:flutter/material.dart';

/// メニューボタン（未実装）
class MenuButtonView extends StatelessWidget {
  const MenuButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      icon: const Icon(Icons.menu),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('メニュー機能は未実装です')));
      },
    );
  }
}
