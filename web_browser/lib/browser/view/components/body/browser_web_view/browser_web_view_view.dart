import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/view/components/body/browser_web_view/browser_web_view_viewmodel.dart';

/// ブラウザのWebView本体
class BrowserWebViewView extends ConsumerWidget {
  const BrowserWebViewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      log("BrowserWebViewView: build called");
    }
    final controller = ref.read(browserWebViewViewModelProvider.notifier).createController(ref);
    final state = ref.watch(browserWebViewViewModelProvider);
    return InAppWebView(
      key: ValueKey(state.url), // URLが変わるたびにWebViewを再作成
      initialUrlRequest: URLRequest(url: WebUri(state.url)),
      initialSettings: controller.settings,
      shouldOverrideUrlLoading: controller.shouldOverrideUrlLoading,
      onLoadStop: controller.onLoadStop,
    );
  }
}
