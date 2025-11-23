// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_path_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rootPath)
const rootPathProvider = RootPathProvider._();

final class RootPathProvider
    extends $FunctionalProvider<NodePath, NodePath, NodePath>
    with $Provider<NodePath> {
  const RootPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rootPathProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rootPathHash();

  @$internal
  @override
  $ProviderElement<NodePath> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NodePath create(Ref ref) {
    return rootPath(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodePath value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodePath>(value),
    );
  }
}

String _$rootPathHash() => r'a8b71aba1856e294fe670d21a6b237192dcefddb';
