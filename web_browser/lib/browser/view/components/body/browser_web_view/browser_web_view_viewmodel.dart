import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/browser_viewmodel.dart';
import 'package:web_browser/browser/view_model/notifiers/current_node_provider.dart';

import 'web_view_state.dart';

part 'browser_web_view_viewmodel.g.dart';

/// BrowserWebViewのViewModel
@riverpod
class BrowserWebViewViewModel extends _$BrowserWebViewViewModel {
  @override
  WebViewState build() {
    log("BrowserWebViewViewModel: build called");

    WebViewState state = ref.watch(currentNodeProviderProvider).url.isEmpty
        ? WebViewState(url: ref.read(browserViewModelProvider).searchUrl)
        : WebViewState(url: ref.watch(currentNodeProviderProvider).url);
    return state;
  }

  BrowserViewModel get browserViewModel => ref.read(browserViewModelProvider);
}
