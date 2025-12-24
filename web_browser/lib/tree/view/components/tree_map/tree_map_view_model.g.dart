// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_map_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TreeMapViewModel)
const treeMapViewModelProvider = TreeMapViewModelProvider._();

final class TreeMapViewModelProvider
    extends $NotifierProvider<TreeMapViewModel, TreeMapState> {
  const TreeMapViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeMapViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeMapViewModelHash();

  @$internal
  @override
  TreeMapViewModel create() => TreeMapViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeMapState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeMapState>(value),
    );
  }
}

String _$treeMapViewModelHash() => r'27f55ad25efb41e34796b224b74d18c775b12441';

abstract class _$TreeMapViewModel extends $Notifier<TreeMapState> {
  TreeMapState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TreeMapState, TreeMapState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TreeMapState, TreeMapState>,
              TreeMapState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
