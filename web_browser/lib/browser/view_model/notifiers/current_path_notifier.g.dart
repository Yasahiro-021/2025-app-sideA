// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_path_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentPathNotifier)
const currentPathProvider = CurrentPathNotifierProvider._();

final class CurrentPathNotifierProvider
    extends $NotifierProvider<CurrentPathNotifier, NodePath> {
  const CurrentPathNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentPathProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentPathNotifierHash();

  @$internal
  @override
  CurrentPathNotifier create() => CurrentPathNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodePath value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodePath>(value),
    );
  }
}

String _$currentPathNotifierHash() =>
    r'db775b7afa5d557603fe56761a642dcd2430e1a4';

abstract class _$CurrentPathNotifier extends $Notifier<NodePath> {
  NodePath build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NodePath, NodePath>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NodePath, NodePath>,
              NodePath,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
