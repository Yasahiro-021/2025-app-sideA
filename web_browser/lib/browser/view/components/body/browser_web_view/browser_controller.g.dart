// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// WebViewイベントの処理とナビゲーション制御を行う

@ProviderFor(BrowserController)
const browserControllerProvider = BrowserControllerProvider._();

/// WebViewイベントの処理とナビゲーション制御を行う
final class BrowserControllerProvider
    extends $NotifierProvider<BrowserController, BrowserController> {
  /// WebViewイベントの処理とナビゲーション制御を行う
  const BrowserControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'browserControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$browserControllerHash();

  @$internal
  @override
  BrowserController create() => BrowserController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrowserController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrowserController>(value),
    );
  }
}

String _$browserControllerHash() => r'2340ec930c6d1fc7a7eeb338461c0c1ef799825b';

/// WebViewイベントの処理とナビゲーション制御を行う

abstract class _$BrowserController extends $Notifier<BrowserController> {
  BrowserController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BrowserController, BrowserController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BrowserController, BrowserController>,
              BrowserController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
