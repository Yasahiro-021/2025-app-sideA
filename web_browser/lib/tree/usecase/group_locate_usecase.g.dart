// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_locate_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///parentPathからGroupを取得し、座標(x,y)を返すUsecase

@ProviderFor(GroupLocateUsecase)
const groupLocateUsecaseProvider = GroupLocateUsecaseFamily._();

///parentPathからGroupを取得し、座標(x,y)を返すUsecase
final class GroupLocateUsecaseProvider
    extends $NotifierProvider<GroupLocateUsecase, (double, double)> {
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
    r'499dd0084685b0bcff777a49251a77d789fddbf5';

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

  ///parentPathからGroupを取得し、座標(x,y)を返すUsecase

  GroupLocateUsecaseProvider call(NodePath parentPath) =>
      GroupLocateUsecaseProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'groupLocateUsecaseProvider';
}

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
