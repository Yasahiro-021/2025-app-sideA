// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stay_switch_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// StaySwitchのViewModel
///
/// 複数追加モードの状態と切り替え処理を管理

@ProviderFor(StaySwitchViewModel)
const staySwitchViewModelProvider = StaySwitchViewModelProvider._();

/// StaySwitchのViewModel
///
/// 複数追加モードの状態と切り替え処理を管理
final class StaySwitchViewModelProvider
    extends $NotifierProvider<StaySwitchViewModel, bool> {
  /// StaySwitchのViewModel
  ///
  /// 複数追加モードの状態と切り替え処理を管理
  const StaySwitchViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staySwitchViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staySwitchViewModelHash();

  @$internal
  @override
  StaySwitchViewModel create() => StaySwitchViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$staySwitchViewModelHash() =>
    r'09c51aafeab630d5623411184c33332ed1562698';

/// StaySwitchのViewModel
///
/// 複数追加モードの状態と切り替え処理を管理

abstract class _$StaySwitchViewModel extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
