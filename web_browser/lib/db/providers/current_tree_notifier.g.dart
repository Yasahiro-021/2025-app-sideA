// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_tree_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 現在選択されているツリーのIDを管理するNotifier
///
/// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
/// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。

@ProviderFor(CurrentTreeNotifier)
const currentTreeProvider = CurrentTreeNotifierProvider._();

/// 現在選択されているツリーのIDを管理するNotifier
///
/// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
/// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。
final class CurrentTreeNotifierProvider
    extends $NotifierProvider<CurrentTreeNotifier, int> {
  /// 現在選択されているツリーのIDを管理するNotifier
  ///
  /// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
  /// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。
  const CurrentTreeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentTreeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentTreeNotifierHash();

  @$internal
  @override
  CurrentTreeNotifier create() => CurrentTreeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentTreeNotifierHash() =>
    r'f6bd1b80ca630c360b81628813a8e29d3bc6f3b5';

/// 現在選択されているツリーのIDを管理するNotifier
///
/// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
/// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。

abstract class _$CurrentTreeNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
