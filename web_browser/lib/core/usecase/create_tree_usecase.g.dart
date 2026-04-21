// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_tree_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateTreeUsecase)
const createTreeUsecaseProvider = CreateTreeUsecaseProvider._();

final class CreateTreeUsecaseProvider
    extends $NotifierProvider<CreateTreeUsecase, CreateTreeUsecase> {
  const CreateTreeUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTreeUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTreeUsecaseHash();

  @$internal
  @override
  CreateTreeUsecase create() => CreateTreeUsecase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTreeUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateTreeUsecase>(value),
    );
  }
}

String _$createTreeUsecaseHash() => r'd687463e25debbea343f15a2c58fc5aecbdb4ecd';

abstract class _$CreateTreeUsecase extends $Notifier<CreateTreeUsecase> {
  CreateTreeUsecase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CreateTreeUsecase, CreateTreeUsecase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateTreeUsecase, CreateTreeUsecase>,
              CreateTreeUsecase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
