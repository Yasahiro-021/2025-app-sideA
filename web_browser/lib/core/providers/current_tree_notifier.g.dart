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
/// ツリーIDはSharedPreferencesに永続化される。

@ProviderFor(CurrentTreeNotifier)
const currentTreeProvider = CurrentTreeNotifierProvider._();

/// 現在選択されているツリーのIDを管理するNotifier
///
/// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
/// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。
/// ツリーIDはSharedPreferencesに永続化される。
final class CurrentTreeNotifierProvider
    extends $AsyncNotifierProvider<CurrentTreeNotifier, TreeId> {
  /// 現在選択されているツリーのIDを管理するNotifier
  ///
  /// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
  /// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。
  /// ツリーIDはSharedPreferencesに永続化される。
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
}

String _$currentTreeNotifierHash() =>
    r'eab4bfe080c9cbf5534415553d53107ca2d70a34';

/// 現在選択されているツリーのIDを管理するNotifier
///
/// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
/// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。
/// ツリーIDはSharedPreferencesに永続化される。

abstract class _$CurrentTreeNotifier extends $AsyncNotifier<TreeId> {
  FutureOr<TreeId> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<TreeId>, TreeId>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TreeId>, TreeId>,
              AsyncValue<TreeId>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
