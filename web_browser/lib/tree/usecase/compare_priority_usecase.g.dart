// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compare_priority_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///currentとtargetの優先度を比較し、compareTo形式で結果を返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
///
///戻り値：currentの優先度が高い場合は1、低い場合は-1、同値の場合は0を返す。

@ProviderFor(ComparePriorityUsecase)
const comparePriorityUsecaseProvider = ComparePriorityUsecaseFamily._();

///currentとtargetの優先度を比較し、compareTo形式で結果を返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
///
///戻り値：currentの優先度が高い場合は1、低い場合は-1、同値の場合は0を返す。
final class ComparePriorityUsecaseProvider
    extends $NotifierProvider<ComparePriorityUsecase, int> {
  ///currentとtargetの優先度を比較し、compareTo形式で結果を返す。
  ///
  ///同一階層でない場合はStateErrorが発生。
  ///
  ///優先度：パスが別れる層において、中央によっている方が優先度が高い。
  ///
  ///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
  ///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
  ///
  ///戻り値：currentの優先度が高い場合は1、低い場合は-1、同値の場合は0を返す。
  const ComparePriorityUsecaseProvider._({
    required ComparePriorityUsecaseFamily super.from,
    required (NodePath, NodePath) super.argument,
  }) : super(
         retry: null,
         name: r'comparePriorityUsecaseProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$comparePriorityUsecaseHash();

  @override
  String toString() {
    return r'comparePriorityUsecaseProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ComparePriorityUsecase create() => ComparePriorityUsecase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ComparePriorityUsecaseProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$comparePriorityUsecaseHash() =>
    r'd651229cb3be8d44b55f27262ccaea0d13c4ca34';

///currentとtargetの優先度を比較し、compareTo形式で結果を返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
///
///戻り値：currentの優先度が高い場合は1、低い場合は-1、同値の場合は0を返す。

final class ComparePriorityUsecaseFamily extends $Family
    with
        $ClassFamilyOverride<
          ComparePriorityUsecase,
          int,
          int,
          int,
          (NodePath, NodePath)
        > {
  const ComparePriorityUsecaseFamily._()
    : super(
        retry: null,
        name: r'comparePriorityUsecaseProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ///currentとtargetの優先度を比較し、compareTo形式で結果を返す。
  ///
  ///同一階層でない場合はStateErrorが発生。
  ///
  ///優先度：パスが別れる層において、中央によっている方が優先度が高い。
  ///
  ///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
  ///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
  ///
  ///戻り値：currentの優先度が高い場合は1、低い場合は-1、同値の場合は0を返す。

  ComparePriorityUsecaseProvider call(NodePath path, NodePath compareTo) =>
      ComparePriorityUsecaseProvider._(argument: (path, compareTo), from: this);

  @override
  String toString() => r'comparePriorityUsecaseProvider';
}

///currentとtargetの優先度を比較し、compareTo形式で結果を返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
///
///戻り値：currentの優先度が高い場合は1、低い場合は-1、同値の場合は0を返す。

abstract class _$ComparePriorityUsecase extends $Notifier<int> {
  late final _$args = ref.$arg as (NodePath, NodePath);
  NodePath get path => _$args.$1;
  NodePath get compareTo => _$args.$2;

  int build(NodePath path, NodePath compareTo);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
