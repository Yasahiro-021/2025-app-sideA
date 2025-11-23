import 'dart:developer';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'browser_viewmodel.g.dart';

/// WebViewイベントの処理とナビゲーション制御を行う

@riverpod
class BrowserViewModel extends _$BrowserViewModel {
  @override
  BrowserViewModel build() {
    return this;
  }

  /// WebViewの各種設定（JavaScript有効化など）
  final InAppWebViewSettings settings = InAppWebViewSettings(
    javaScriptEnabled: true,
  );

  /// 検索用URL（アプリ起動時に最初に表示するURL）
  final String searchUrl = 'https://www.google.com/';

  /// URLかどうか判定
  bool isGoogleUrl(String url) => url.startsWith(searchUrl);

  /// WebView生成時に呼ばれるコールバック
  void onWebViewCreated(InAppWebViewController controller) {
  }

  /// ページ読み込み完了時に呼ばれるコールバック
  void onLoadStop(InAppWebViewController controller, WebUri? loadedUrl) async {
    if (loadedUrl == null) return;
    final urlStr = loadedUrl.toString();

    // ページタイトル取得
    String? title = await controller.getTitle();
    final pageTitle = (title != null && title.isNotEmpty) ? title : urlStr;

    log('ページ読み込み完了: $urlStr (タイトル: $pageTitle)');
  }

  /// リンククリック時に呼ばれるコールバック
  Future<NavigationActionPolicy> shouldOverrideUrlLoading(
    InAppWebViewController controller,
    NavigationAction navigationAction,
  ) async {
    final urlStr = navigationAction.request.url.toString();
    log('リンククリック: $urlStr');

    //TODO multiAddEnabledNotifierに応じて、戻り値のALLOWとDENYを切り替える。

    return NavigationActionPolicy.ALLOW;
  }
}