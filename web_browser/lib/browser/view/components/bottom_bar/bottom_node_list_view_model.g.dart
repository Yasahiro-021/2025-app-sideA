// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_node_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// BottomNodeListのViewModel

@ProviderFor(bottomNodeListViewModel)
const bottomNodeListViewModelProvider = BottomNodeListViewModelProvider._();

/// BottomNodeListのViewModel

final class BottomNodeListViewModelProvider
    extends $FunctionalProvider<List<NodePath>, List<NodePath>, List<NodePath>>
    with $Provider<List<NodePath>> {
  /// BottomNodeListのViewModel
  const BottomNodeListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bottomNodeListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bottomNodeListViewModelHash();

  @$internal
  @override
  $ProviderElement<List<NodePath>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<NodePath> create(Ref ref) {
    return bottomNodeListViewModel(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<NodePath> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<NodePath>>(value),
    );
  }
}

String _$bottomNodeListViewModelHash() =>
    r'15407c925d1da229a1d1c29ff6462584f3afb75c';
