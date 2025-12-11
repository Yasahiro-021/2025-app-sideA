// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_node_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mockNodeUsecase)
const mockNodeUsecaseProvider = MockNodeUsecaseProvider._();

final class MockNodeUsecaseProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  const MockNodeUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mockNodeUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mockNodeUsecaseHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return mockNodeUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$mockNodeUsecaseHash() => r'55d964a8c183ea00e30770deeee39956e91cd8c7';
