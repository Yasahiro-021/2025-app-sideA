// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_at_path_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChildrenAtPathManger)
const childrenAtPathMangerProvider = ChildrenAtPathMangerFamily._();

final class ChildrenAtPathMangerProvider
    extends $NotifierProvider<ChildrenAtPathManger, NodeChildren> {
  const ChildrenAtPathMangerProvider._({
    required ChildrenAtPathMangerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'childrenAtPathMangerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$childrenAtPathMangerHash();

  @override
  String toString() {
    return r'childrenAtPathMangerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChildrenAtPathManger create() => ChildrenAtPathManger();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeChildren value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeChildren>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChildrenAtPathMangerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$childrenAtPathMangerHash() =>
    r'c98abbba65a90f32817a320f0d7bde2e6e77ea8f';

final class ChildrenAtPathMangerFamily extends $Family
    with
        $ClassFamilyOverride<
          ChildrenAtPathManger,
          NodeChildren,
          NodeChildren,
          NodeChildren,
          NodePath
        > {
  const ChildrenAtPathMangerFamily._()
    : super(
        retry: null,
        name: r'childrenAtPathMangerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ChildrenAtPathMangerProvider call(NodePath parentPath) =>
      ChildrenAtPathMangerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'childrenAtPathMangerProvider';
}

abstract class _$ChildrenAtPathManger extends $Notifier<NodeChildren> {
  late final _$args = ref.$arg as NodePath;
  NodePath get parentPath => _$args;

  NodeChildren build(NodePath parentPath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<NodeChildren, NodeChildren>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NodeChildren, NodeChildren>,
              NodeChildren,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
