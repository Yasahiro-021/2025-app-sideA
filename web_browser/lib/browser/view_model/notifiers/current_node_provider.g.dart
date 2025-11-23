// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_node_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 現在のノードを提供する

@ProviderFor(currentNodeProvider)
const currentNodeProviderProvider = CurrentNodeProviderProvider._();

/// 現在のノードを提供する

final class CurrentNodeProviderProvider
    extends $FunctionalProvider<BrowserNode, BrowserNode, BrowserNode>
    with $Provider<BrowserNode> {
  /// 現在のノードを提供する
  const CurrentNodeProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentNodeProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentNodeProviderHash();

  @$internal
  @override
  $ProviderElement<BrowserNode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BrowserNode create(Ref ref) {
    return currentNodeProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrowserNode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrowserNode>(value),
    );
  }
}

String _$currentNodeProviderHash() =>
    r'573f4729f67844e7a423be582c643e4ca44534c7';
