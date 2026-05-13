import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/view/components/app_bar/browser_app_bar_view.dart';
import 'package:web_browser/browser/view/components/bottom_bar/browser_bottom_bar_view.dart';
import 'package:web_browser/browser/view/components/body/browser_web_view/browser_web_view_view.dart';
import 'package:web_browser/browser/view/components/body/floating_search_bar/floating_search_bar_view.dart';
import 'package:web_browser/core/providers/current_tree_notifier.dart';
import 'package:web_browser/core/tree/tree_id.dart';

/// ブラウザ画面のエントリーポイント
class BrowserView extends ConsumerStatefulWidget {
  const BrowserView({required this.treeId, super.key});

  //表示するツリーのID
  final TreeId treeId;

  @override
  ConsumerState<BrowserView> createState() => _BrowserViewState();
}

class _BrowserViewState extends ConsumerState<BrowserView> {
  @override
  void initState() {
    super.initState();
    ref.read(currentTreeProvider.notifier).setCurrentTree(widget.treeId);
  }

  @override
  void didUpdateWidget(covariant BrowserView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.treeId != widget.treeId) {
      ref.read(currentTreeProvider.notifier).setCurrentTree(widget.treeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrowserAppBarView(),
      body: BrowserWebViewView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingSearchBarView(),
      bottomNavigationBar: BrowserBottomBarView(),
    );
  }
}
