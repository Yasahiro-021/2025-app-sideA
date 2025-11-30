// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_position_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetPosition)
const getPositionProvider = GetPositionFamily._();

final class GetPositionProvider
    extends $NotifierProvider<GetPosition, NodeLocation> {
  const GetPositionProvider._({
    required GetPositionFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'getPositionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getPositionHash();

  @override
  String toString() {
    return r'getPositionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetPosition create() => GetPosition();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeLocation value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeLocation>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetPositionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getPositionHash() => r'ca6da3e70ca46069b83d07ae9f3ba98118039301';

final class GetPositionFamily extends $Family
    with
        $ClassFamilyOverride<
          GetPosition,
          NodeLocation,
          NodeLocation,
          NodeLocation,
          NodePath
        > {
  const GetPositionFamily._()
    : super(
        retry: null,
        name: r'getPositionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetPositionProvider call(NodePath nodePath) =>
      GetPositionProvider._(argument: nodePath, from: this);

  @override
  String toString() => r'getPositionProvider';
}

abstract class _$GetPosition extends $Notifier<NodeLocation> {
  late final _$args = ref.$arg as NodePath;
  NodePath get nodePath => _$args;

  NodeLocation build(NodePath nodePath);
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
