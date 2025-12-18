// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_settengs_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(treeSettings)
const treeSettingsProvider = TreeSettingsProvider._();

final class TreeSettingsProvider
    extends $FunctionalProvider<TreeSettings, TreeSettings, TreeSettings>
    with $Provider<TreeSettings> {
  const TreeSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeSettingsHash();

  @$internal
  @override
  $ProviderElement<TreeSettings> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TreeSettings create(Ref ref) {
    return treeSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeSettings>(value),
    );
  }
}

String _$treeSettingsHash() => r'00d0a4bcca738b6cf5aa75d0ff2412e25f99b529';
