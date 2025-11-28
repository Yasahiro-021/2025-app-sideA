// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_web_view_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// BrowserWebViewのViewModel

@ProviderFor(BrowserWebViewViewModel)
const browserWebViewViewModelProvider = BrowserWebViewViewModelProvider._();

/// BrowserWebViewのViewModel
final class BrowserWebViewViewModelProvider
    extends $NotifierProvider<BrowserWebViewViewModel, WebViewState> {
  /// BrowserWebViewのViewModel
  const BrowserWebViewViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'browserWebViewViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$browserWebViewViewModelHash();

  @$internal
  @override
  BrowserWebViewViewModel create() => BrowserWebViewViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WebViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WebViewState>(value),
    );
  }
}

String _$browserWebViewViewModelHash() =>
    r'9534626fa26bb56c5c9f08c7e1ac453042313138';

/// BrowserWebViewのViewModel

abstract class _$BrowserWebViewViewModel extends $Notifier<WebViewState> {
  WebViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WebViewState, WebViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WebViewState, WebViewState>,
              WebViewState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
