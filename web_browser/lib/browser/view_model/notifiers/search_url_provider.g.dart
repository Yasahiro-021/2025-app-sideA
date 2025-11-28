// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_url_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchUrl)
const searchUrlProvider = SearchUrlProvider._();

final class SearchUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const SearchUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return searchUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchUrlHash() => r'ce2aaba05a2501d752102f5bbe87192086369601';
