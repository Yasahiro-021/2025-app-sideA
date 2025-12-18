// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_location_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///parentPathからGroupを取得し、座標(x,y)を返すUsecase

@ProviderFor(GroupLocationManager)
const groupLocationManagerProvider = GroupLocationManagerFamily._();

///parentPathからGroupを取得し、座標(x,y)を返すUsecase
final class GroupLocationManagerProvider
    extends $NotifierProvider<GroupLocationManager, (double, double)> {
  ///parentPathからGroupを取得し、座標(x,y)を返すUsecase
  const GroupLocationManagerProvider._({
    required GroupLocationManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'groupLocationManagerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupLocationManagerHash();

  @override
  String toString() {
    return r'groupLocationManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GroupLocationManager create() => GroupLocationManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((double, double) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(double, double)>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GroupLocationManagerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupLocationManagerHash() =>
    r'4c24bf610acac8aec9019e9402763d18855caae2';

///parentPathからGroupを取得し、座標(x,y)を返すUsecase

final class GroupLocationManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          GroupLocationManager,
          (double, double),
          (double, double),
          (double, double),
          NodePath
        > {
  const GroupLocationManagerFamily._()
    : super(
        retry: null,
        name: r'groupLocationManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ///parentPathからGroupを取得し、座標(x,y)を返すUsecase

  GroupLocationManagerProvider call(NodePath parentPath) =>
      GroupLocationManagerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'groupLocationManagerProvider';
}

///parentPathからGroupを取得し、座標(x,y)を返すUsecase

abstract class _$GroupLocationManager extends $Notifier<(double, double)> {
  late final _$args = ref.$arg as NodePath;
  NodePath get parentPath => _$args;

  (double, double) build(NodePath parentPath);
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
