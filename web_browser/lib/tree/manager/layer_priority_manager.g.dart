// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layer_priority_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///同一レイヤー(同一depth)のGroupを管理する

@ProviderFor(LayerPriorityManager)
const layerPriorityManagerProvider = LayerPriorityManagerFamily._();

///同一レイヤー(同一depth)のGroupを管理する
final class LayerPriorityManagerProvider
    extends $NotifierProvider<LayerPriorityManager, List<NodeGroup>> {
  ///同一レイヤー(同一depth)のGroupを管理する
  const LayerPriorityManagerProvider._({
    required LayerPriorityManagerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'layerPriorityManagerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$layerPriorityManagerHash();

  @override
  String toString() {
    return r'layerPriorityManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LayerPriorityManager create() => LayerPriorityManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<NodeGroup> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<NodeGroup>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LayerPriorityManagerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$layerPriorityManagerHash() =>
    r'b0d89141dc31ac5199fd390358be2f62e5493b3f';

///同一レイヤー(同一depth)のGroupを管理する

final class LayerPriorityManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          LayerPriorityManager,
          List<NodeGroup>,
          List<NodeGroup>,
          List<NodeGroup>,
          int
        > {
  const LayerPriorityManagerFamily._()
    : super(
        retry: null,
        name: r'layerPriorityManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ///同一レイヤー(同一depth)のGroupを管理する

  LayerPriorityManagerProvider call(int depth) =>
      LayerPriorityManagerProvider._(argument: depth, from: this);

  @override
  String toString() => r'layerPriorityManagerProvider';
}

///同一レイヤー(同一depth)のGroupを管理する

abstract class _$LayerPriorityManager extends $Notifier<List<NodeGroup>> {
  late final _$args = ref.$arg as int;
  int get depth => _$args;

  List<NodeGroup> build(int depth);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<List<NodeGroup>, List<NodeGroup>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<NodeGroup>, List<NodeGroup>>,
              List<NodeGroup>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
