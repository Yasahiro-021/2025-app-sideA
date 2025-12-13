// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_add_enabled_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 複数ノード追加の有効/無効を管理するNotifierクラス
///
/// リンククリック時に自動的に新しいノードを追加するかを制御

@ProviderFor(MultiAddEnabledNotifier)
const multiAddEnabledProvider = MultiAddEnabledNotifierProvider._();

/// 複数ノード追加の有効/無効を管理するNotifierクラス
///
/// リンククリック時に自動的に新しいノードを追加するかを制御
final class MultiAddEnabledNotifierProvider
    extends $NotifierProvider<MultiAddEnabledNotifier, bool> {
  /// 複数ノード追加の有効/無効を管理するNotifierクラス
  ///
  /// リンククリック時に自動的に新しいノードを追加するかを制御
  const MultiAddEnabledNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'multiAddEnabledProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$multiAddEnabledNotifierHash();

  @$internal
  @override
  MultiAddEnabledNotifier create() => MultiAddEnabledNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$multiAddEnabledNotifierHash() =>
    r'b5bcfe0ad9bfaa01967a488bf30051533c4486b0';

/// 複数ノード追加の有効/無効を管理するNotifierクラス
///
/// リンククリック時に自動的に新しいノードを追加するかを制御

abstract class _$MultiAddEnabledNotifier extends $Notifier<bool> {
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
