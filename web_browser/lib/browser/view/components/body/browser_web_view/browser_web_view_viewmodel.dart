import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/view/components/body/browser_web_view/browser_controller.dart';
import 'package:web_browser/browser/view_model/notifiers/current_node_provider.dart';
import 'package:web_browser/browser/view_model/notifiers/search_url_provider.dart';

import 'web_view_state.dart';

part 'browser_web_view_viewmodel.g.dart';

/// BrowserWebViewのViewModel
@riverpod
class BrowserWebViewViewModel extends _$BrowserWebViewViewModel {
  @override
  WebViewState build() {

    WebViewState state = ref.watch(currentNodeProviderProvider).url.isEmpty
        ? WebViewState(url: ref.read(searchUrlProvider))
        : WebViewState(url: ref.watch(currentNodeProviderProvider).url);
    return state;
  }

  /// BrowserControllerを生成（WidgetRefを渡す）
  BrowserController createController(WidgetRef widgetRef) {
    return BrowserController(widgetRef);
  }
}
