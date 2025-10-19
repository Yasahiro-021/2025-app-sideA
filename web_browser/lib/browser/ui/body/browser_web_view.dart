import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/browser_controller.dart';

/// ブラウザのWebView本体
class BrowserWebView extends ConsumerWidget {
  const BrowserWebView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(browserControllerProvider);
    
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(controller.initialUrl),
      ),
      initialSettings: controller.settings,
      onWebViewCreated: (webViewController) {
        controller.onWebViewCreated(webViewController);
      },
      onLoadStop: (webViewController, url) {
        controller.onLoadStop(webViewController, url);
      },
      shouldOverrideUrlLoading: (webViewController, navigationAction) {
        return controller.shouldOverrideUrlLoading(
          webViewController,
          navigationAction,
        );
      },
    );
  }
}
