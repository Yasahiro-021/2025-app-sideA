// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_locate_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///TODO Riverpodで実装する必要があるか検討する
///parentPathからGroupを取得し、座標(x,y)を返すUsecase

@ProviderFor(GroupLocateUsecase)
const groupLocateUsecaseProvider = GroupLocateUsecaseFamily._();

///TODO Riverpodで実装する必要があるか検討する
///parentPathからGroupを取得し、座標(x,y)を返すUsecase
final class GroupLocateUsecaseProvider
    extends $NotifierProvider<GroupLocateUsecase, (double, double)> {
  ///TODO Riverpodで実装する必要があるか検討する
  ///parentPathからGroupを取得し、座標(x,y)を返すUsecase
  const GroupLocateUsecaseProvider._({
    required GroupLocateUsecaseFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'groupLocateUsecaseProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupLocateUsecaseHash();

  @override
  String toString() {
    return r'groupLocateUsecaseProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GroupLocateUsecase create() => GroupLocateUsecase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((double, double) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(double, double)>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GroupLocateUsecaseProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupLocateUsecaseHash() =>
    r'7092e6f74ba11178281ab9035ab767768bd5905e';

///TODO Riverpodで実装する必要があるか検討する
///parentPathからGroupを取得し、座標(x,y)を返すUsecase

final class GroupLocateUsecaseFamily extends $Family
    with
        $ClassFamilyOverride<
          GroupLocateUsecase,
          (double, double),
          (double, double),
          (double, double),
          NodePath
        > {
  const GroupLocateUsecaseFamily._()
    : super(
        retry: null,
        name: r'groupLocateUsecaseProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ///TODO Riverpodで実装する必要があるか検討する
  ///parentPathからGroupを取得し、座標(x,y)を返すUsecase

  GroupLocateUsecaseProvider call(NodePath parentPath) =>
      GroupLocateUsecaseProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'groupLocateUsecaseProvider';
}

///TODO Riverpodで実装する必要があるか検討する
///parentPathからGroupを取得し、座標(x,y)を返すUsecase

abstract class _$GroupLocateUsecase extends $Notifier<(double, double)> {
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
