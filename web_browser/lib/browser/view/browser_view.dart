import 'package:flutter/material.dart';
import 'package:web_browser/browser/view/components/app_bar/browser_app_bar_view.dart';
import 'package:web_browser/browser/view/components/bottom_bar/browser_bottom_bar_view.dart';
import 'package:web_browser/browser/view/components/body/browser_web_view/browser_web_view_view.dart';
import 'package:web_browser/browser/view/components/body/floating_search_bar/floating_search_bar_view.dart';

/// ブラウザ画面のエントリーポイント
class BrowserView extends StatelessWidget {
  const BrowserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BrowserAppBarView(),
      body: BrowserWebViewView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingSearchBarView(),
      bottomNavigationBar: BrowserBottomBarView(),
    );
  }
}
