// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_node_children_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BrowserNodeChildrenNotifier)
const browserNodeChildrenProvider = BrowserNodeChildrenNotifierFamily._();

final class BrowserNodeChildrenNotifierProvider
    extends $NotifierProvider<BrowserNodeChildrenNotifier, NodeChildren> {
  const BrowserNodeChildrenNotifierProvider._({
    required BrowserNodeChildrenNotifierFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'browserNodeChildrenProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$browserNodeChildrenNotifierHash();

  @override
  String toString() {
    return r'browserNodeChildrenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BrowserNodeChildrenNotifier create() => BrowserNodeChildrenNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodeChildren value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeChildren>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BrowserNodeChildrenNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$browserNodeChildrenNotifierHash() =>
    r'2af2bb7758b52935d9e55da0f89d9c663904786d';

final class BrowserNodeChildrenNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BrowserNodeChildrenNotifier,
          NodeChildren,
          NodeChildren,
          NodeChildren,
          NodePath
        > {
  const BrowserNodeChildrenNotifierFamily._()
    : super(
        retry: null,
        name: r'browserNodeChildrenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  BrowserNodeChildrenNotifierProvider call(NodePath parentPath) =>
      BrowserNodeChildrenNotifierProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'browserNodeChildrenProvider';
}

abstract class _$BrowserNodeChildrenNotifier extends $Notifier<NodeChildren> {
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
