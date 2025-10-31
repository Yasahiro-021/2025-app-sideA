import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:web_browser/browser/view/components/body/browser_web_view/browser_web_view_viewmodel.dart';

/// ブラウザのWebView本体
class BrowserWebViewView extends ConsumerWidget {
  const BrowserWebViewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(browserWebViewViewModelProvider);
    
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(viewModel.initialUrl),
      ),
      initialSettings: viewModel.settings,
      onWebViewCreated: (webViewController) {
        viewModel.onWebViewCreated(webViewController);
      },
      onLoadStop: (webViewController, url) {
        viewModel.onLoadStop(webViewController, url);
      },
      shouldOverrideUrlLoading: (webViewController, navigationAction) {
        return viewModel.shouldOverrideUrlLoading(
          webViewController,
          navigationAction,
        );
      },
    );
  }
}
