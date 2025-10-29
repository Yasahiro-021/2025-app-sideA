import 'package:flutter/material.dart';
import 'package:web_browser/browser/ui/floating_search_bar.dart';

/// ブラウザ画面のFloatingActionButton部分
class BrowserFloatingActionButton extends StatelessWidget {
  const BrowserFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const FloatingSearchBar();
  }
}
