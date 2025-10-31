import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/browser_viewmodel.dart';

/// BrowserWebViewのViewModel
/// 
/// WebViewの設定と各種イベントハンドラを提供
class BrowserWebViewViewModel {
  final Ref ref;

  BrowserWebViewViewModel(this.ref);

  /// BrowserViewModelを取得
  BrowserViewModel get _browserViewModel => ref.read(browserViewModelProvider);

  /// WebViewの設定
  InAppWebViewSettings get settings => _browserViewModel.settings;

  /// 初期URL
  String get initialUrl => _browserViewModel.initialUrl;

  /// WebView生成時のコールバック
  void onWebViewCreated(InAppWebViewController controller) {
    _browserViewModel.onWebViewCreated(controller);
  }

  /// ページ読み込み完了時のコールバック
  void onLoadStop(InAppWebViewController controller, WebUri? url) {
    _browserViewModel.onLoadStop(controller, url);
  }

  /// URL読み込み前のコールバック
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(
    InAppWebViewController controller,
    NavigationAction navigationAction,
  ) {
    return _browserViewModel.shouldOverrideUrlLoading(controller, navigationAction);
  }
}

/// BrowserWebViewViewModelのProvider
final browserWebViewViewModelProvider = Provider((ref) {
  return BrowserWebViewViewModel(ref);
});
