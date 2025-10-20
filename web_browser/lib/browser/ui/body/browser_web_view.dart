import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/browser_controller.dart';

/// ブラウザのWebView本体
class BrowserWebView extends ConsumerWidget {
  const BrowserWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 定数的なプロパティは一度だけ読み取る
    final controller = ref.read(browserControllerProvider);
    
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(controller.initialUrl),
      ),
      initialSettings: controller.settings,
      onWebViewCreated: (webViewController) {
        ref.read(browserControllerProvider).onWebViewCreated(webViewController);
      },
      onLoadStop: (webViewController, url) {
        ref.read(browserControllerProvider).onLoadStop(webViewController, url);
      },
      shouldOverrideUrlLoading: (webViewController, navigationAction) {
        return ref.read(browserControllerProvider).shouldOverrideUrlLoading(
          webViewController,
          navigationAction,
        );
      },
    );
  }
}
