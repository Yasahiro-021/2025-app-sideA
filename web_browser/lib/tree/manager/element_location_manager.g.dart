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
    extends $NotifierProvider<ElementLocationManager, (double, double)> {
  const ElementLocationManagerProvider._({
    required ElementLocationManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'elementLocationManagerProvider',
         isAutoDispose: true,
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
  Override overrideWithValue((double, double) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(double, double)>(value),
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
    r'31b4c017a6cf83adb312578dd90595e5ca68322a';

final class ElementLocationManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          ElementLocationManager,
          (double, double),
          (double, double),
          (double, double),
          NodePath
        > {
  const ElementLocationManagerFamily._()
    : super(
        retry: null,
        name: r'elementLocationManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ElementLocationManagerProvider call(NodePath nodePath) =>
      ElementLocationManagerProvider._(argument: nodePath, from: this);

  @override
  String toString() => r'elementLocationManagerProvider';
}

abstract class _$ElementLocationManager extends $Notifier<(double, double)> {
  late final _$args = ref.$arg as NodePath;
  NodePath get nodePath => _$args;

  (double, double) build(NodePath nodePath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<(double, double), (double, double)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<(double, double), (double, double)>,
              (double, double),
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
