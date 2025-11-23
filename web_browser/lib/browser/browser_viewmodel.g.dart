// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// WebViewイベントの処理とナビゲーション制御を行う

@ProviderFor(BrowserViewModel)
const browserViewModelProvider = BrowserViewModelProvider._();

/// WebViewイベントの処理とナビゲーション制御を行う
final class BrowserViewModelProvider
    extends $NotifierProvider<BrowserViewModel, BrowserViewModel> {
  /// WebViewイベントの処理とナビゲーション制御を行う
  const BrowserViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'browserViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$browserViewModelHash();

  @$internal
  @override
  BrowserViewModel create() => BrowserViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrowserViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrowserViewModel>(value),
    );
  }
}

String _$browserViewModelHash() => r'8cfea43d69497bd2b4affa7f866199d05835a75a';

/// WebViewイベントの処理とナビゲーション制御を行う

abstract class _$BrowserViewModel extends $Notifier<BrowserViewModel> {
  BrowserViewModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BrowserViewModel, BrowserViewModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BrowserViewModel, BrowserViewModel>,
              BrowserViewModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
