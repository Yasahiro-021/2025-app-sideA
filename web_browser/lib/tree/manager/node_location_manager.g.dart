// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_location_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NodeLocationManager)
const nodeLocationManagerProvider = NodeLocationManagerFamily._();

final class NodeLocationManagerProvider
    extends $NotifierProvider<NodeLocationManager, NodeLocation> {
  const NodeLocationManagerProvider._({
    required NodeLocationManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'nodeLocationManagerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nodeLocationManagerHash();

  @override
  String toString() {
    return r'nodeLocationManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NodeLocationManager create() => NodeLocationManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeLocation value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeLocation>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NodeLocationManagerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nodeLocationManagerHash() =>
    r'90853888ee7f4d78df80c81ce13336e60fde1ea8';

final class NodeLocationManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          NodeLocationManager,
          NodeLocation,
          NodeLocation,
          NodeLocation,
          NodePath
        > {
  const NodeLocationManagerFamily._()
    : super(
        retry: null,
        name: r'nodeLocationManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NodeLocationManagerProvider call(NodePath path) =>
      NodeLocationManagerProvider._(argument: path, from: this);

  @override
  String toString() => r'nodeLocationManagerProvider';
}

abstract class _$NodeLocationManager extends $Notifier<NodeLocation> {
  late final _$args = ref.$arg as NodePath;
  NodePath get path => _$args;

  NodeLocation build(NodePath path);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<NodeLocation, NodeLocation>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NodeLocation, NodeLocation>,
              NodeLocation,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
