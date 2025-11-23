import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/view/components/body/browser_web_view/browser_web_view_viewmodel.dart';

/// ブラウザのWebView本体
class BrowserWebViewView extends ConsumerWidget {
  const BrowserWebViewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("BrowserWebViewView: build called");
    final viewModel = ref.watch(browserWebViewViewModelProvider);

    return InAppWebView(
      key: ValueKey(viewModel.url), // URLが変わるたびにWebViewを再作成
      initialUrlRequest: URLRequest(url: WebUri(viewModel.url)),
      //TODO 画面遷移時の処理を追加
    );
  }
}
