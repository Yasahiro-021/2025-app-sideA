import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// WebViewコントローラーを管理するNotifierクラス
///
/// InAppWebViewControllerの保持と提供を担当
class WebViewControllerNotifier
    extends Notifier<InAppWebViewController?> {
  @override
  InAppWebViewController? build() {
    // 初期状態はnull（WebViewがまだ作成されていない）
    return null;
  }

  /// コントローラーの設定
  void setController(InAppWebViewController controller) {
    state = controller;
  }
}

final webViewControllerNotifierProvider =
    NotifierProvider<WebViewControllerNotifier, InAppWebViewController?>(
  () => WebViewControllerNotifier(),
);
