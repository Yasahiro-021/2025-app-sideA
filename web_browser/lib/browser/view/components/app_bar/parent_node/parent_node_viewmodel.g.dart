// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_node_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ParentNodeのViewModel
///
/// 親ノードの情報と親ノードへの遷移処理を管理
///

@ProviderFor(ParentNodeViewModel)
const parentNodeViewModelProvider = ParentNodeViewModelProvider._();

/// ParentNodeのViewModel
///
/// 親ノードの情報と親ノードへの遷移処理を管理
///
final class ParentNodeViewModelProvider
    extends $NotifierProvider<ParentNodeViewModel, ParentNodeState?> {
  /// ParentNodeのViewModel
  ///
  /// 親ノードの情報と親ノードへの遷移処理を管理
  ///
  const ParentNodeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'parentNodeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$parentNodeViewModelHash();

  @$internal
  @override
  ParentNodeViewModel create() => ParentNodeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ParentNodeState? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ParentNodeState?>(value),
    );
  }
}

String _$parentNodeViewModelHash() =>
    r'6aee38c7321dac77d351950df8bcc120916e3714';

/// ParentNodeのViewModel
///
/// 親ノードの情報と親ノードへの遷移処理を管理
///

abstract class _$ParentNodeViewModel extends $Notifier<ParentNodeState?> {
  ParentNodeState? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ParentNodeState?, ParentNodeState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ParentNodeState?, ParentNodeState?>,
              ParentNodeState?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
