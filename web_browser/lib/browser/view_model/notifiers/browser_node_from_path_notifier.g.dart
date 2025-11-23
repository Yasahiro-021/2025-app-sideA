// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_node_from_path_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BrowserNodeFromPathNotifier)
const browserNodeFromPathProvider = BrowserNodeFromPathNotifierFamily._();

final class BrowserNodeFromPathNotifierProvider
    extends $NotifierProvider<BrowserNodeFromPathNotifier, BrowserNode> {
  const BrowserNodeFromPathNotifierProvider._({
    required BrowserNodeFromPathNotifierFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'browserNodeFromPathProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$browserNodeFromPathNotifierHash();

  @override
  String toString() {
    return r'browserNodeFromPathProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BrowserNodeFromPathNotifier create() => BrowserNodeFromPathNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrowserNode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrowserNode>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BrowserNodeFromPathNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$browserNodeFromPathNotifierHash() =>
    r'd2902e087e453ad8509d4ba2eb020adfd1e8e3c1';

final class BrowserNodeFromPathNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BrowserNodeFromPathNotifier,
          BrowserNode,
          BrowserNode,
          BrowserNode,
          NodePath
        > {
  const BrowserNodeFromPathNotifierFamily._()
    : super(
        retry: null,
        name: r'browserNodeFromPathProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  BrowserNodeFromPathNotifierProvider call(NodePath path) =>
      BrowserNodeFromPathNotifierProvider._(argument: path, from: this);

  @override
  String toString() => r'browserNodeFromPathProvider';
}

abstract class _$BrowserNodeFromPathNotifier extends $Notifier<BrowserNode> {
  late final _$args = ref.$arg as NodePath;
  NodePath get path => _$args;

  BrowserNode build(NodePath path);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<BrowserNode, BrowserNode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BrowserNode, BrowserNode>,
              BrowserNode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
