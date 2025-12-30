// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_location_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ElementLocationManager)
const elementLocationManagerProvider = ElementLocationManagerFamily._();

final class ElementLocationManagerProvider
    extends $NotifierProvider<ElementLocationManager, ElementLocation> {
  const ElementLocationManagerProvider._({
    required ElementLocationManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'elementLocationManagerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$elementLocationManagerHash();

  @override
  String toString() {
    return r'elementLocationManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ElementLocationManager create() => ElementLocationManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ElementLocation value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ElementLocation>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ElementLocationManagerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$elementLocationManagerHash() =>
    r'706d1a551f41bcf340a2006862af71aa8336b9c4';

final class ElementLocationManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          ElementLocationManager,
          ElementLocation,
          ElementLocation,
          ElementLocation,
          NodePath
        > {
  const ElementLocationManagerFamily._()
    : super(
        retry: null,
        name: r'elementLocationManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ElementLocationManagerProvider call(NodePath nodePath) =>
      ElementLocationManagerProvider._(argument: nodePath, from: this);

  @override
  String toString() => r'elementLocationManagerProvider';
}

abstract class _$ElementLocationManager extends $Notifier<ElementLocation> {
  late final _$args = ref.$arg as NodePath;
  NodePath get nodePath => _$args;

  ElementLocation build(NodePath nodePath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ElementLocation, ElementLocation>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ElementLocation, ElementLocation>,
              ElementLocation,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
