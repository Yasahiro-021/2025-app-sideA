// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_node_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateNodeUsecase)
const createNodeUsecaseProvider = CreateNodeUsecaseProvider._();

final class CreateNodeUsecaseProvider
    extends $NotifierProvider<CreateNodeUsecase, CreateNodeUsecase> {
  const CreateNodeUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createNodeUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createNodeUsecaseHash();

  @$internal
  @override
  CreateNodeUsecase create() => CreateNodeUsecase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateNodeUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateNodeUsecase>(value),
    );
  }
}

String _$createNodeUsecaseHash() => r'86c2c5724559d24b15df1f2bb480b91e3c3290b2';

abstract class _$CreateNodeUsecase extends $Notifier<CreateNodeUsecase> {
  CreateNodeUsecase build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CreateNodeUsecase, CreateNodeUsecase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CreateNodeUsecase, CreateNodeUsecase>,
              CreateNodeUsecase,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
