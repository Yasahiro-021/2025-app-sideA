// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ElementViewModel)
const elementViewModelProvider = ElementViewModelFamily._();

final class ElementViewModelProvider
    extends $NotifierProvider<ElementViewModel, ElementState> {
  const ElementViewModelProvider._({
    required ElementViewModelFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'elementViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$elementViewModelHash();

  @override
  String toString() {
    return r'elementViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ElementViewModel create() => ElementViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ElementState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ElementState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ElementViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$elementViewModelHash() => r'eb5cad944a048006bbbe164d61dcb6df7756b56e';

final class ElementViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ElementViewModel,
          ElementState,
          ElementState,
          ElementState,
          NodePath
        > {
  const ElementViewModelFamily._()
    : super(
        retry: null,
        name: r'elementViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ElementViewModelProvider call(NodePath nodePath) =>
      ElementViewModelProvider._(argument: nodePath, from: this);

  @override
  String toString() => r'elementViewModelProvider';
}

abstract class _$ElementViewModel extends $Notifier<ElementState> {
  late final _$args = ref.$arg as NodePath;
  NodePath get nodePath => _$args;

  ElementState build(NodePath nodePath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ElementState, ElementState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ElementState, ElementState>,
              ElementState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
