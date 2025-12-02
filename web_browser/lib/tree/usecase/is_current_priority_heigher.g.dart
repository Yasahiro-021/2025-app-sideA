// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_current_priority_heigher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///currentがtargetに対して優先度が高いかどうかを判定する。同値の場合もfalseを返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。

@ProviderFor(IsCurrentPriorityHeigher)
const isCurrentPriorityHeigherProvider = IsCurrentPriorityHeigherFamily._();

///currentがtargetに対して優先度が高いかどうかを判定する。同値の場合もfalseを返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
final class IsCurrentPriorityHeigherProvider
    extends $NotifierProvider<IsCurrentPriorityHeigher, bool> {
  ///currentがtargetに対して優先度が高いかどうかを判定する。同値の場合もfalseを返す。
  ///
  ///同一階層でない場合はStateErrorが発生。
  ///
  ///優先度：パスが別れる層において、中央によっている方が優先度が高い。
  ///
  ///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
  ///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
  const IsCurrentPriorityHeigherProvider._({
    required IsCurrentPriorityHeigherFamily super.from,
    required (NodePath, NodePath) super.argument,
  }) : super(
         retry: null,
         name: r'isCurrentPriorityHeigherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isCurrentPriorityHeigherHash();

  @override
  String toString() {
    return r'isCurrentPriorityHeigherProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  IsCurrentPriorityHeigher create() => IsCurrentPriorityHeigher();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsCurrentPriorityHeigherProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isCurrentPriorityHeigherHash() =>
    r'7fde910a6e5cbb3151f305b64716f7a2eb510dd4';

///currentがtargetに対して優先度が高いかどうかを判定する。同値の場合もfalseを返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。

final class IsCurrentPriorityHeigherFamily extends $Family
    with
        $ClassFamilyOverride<
          IsCurrentPriorityHeigher,
          bool,
          bool,
          bool,
          (NodePath, NodePath)
        > {
  const IsCurrentPriorityHeigherFamily._()
    : super(
        retry: null,
        name: r'isCurrentPriorityHeigherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ///currentがtargetに対して優先度が高いかどうかを判定する。同値の場合もfalseを返す。
  ///
  ///同一階層でない場合はStateErrorが発生。
  ///
  ///優先度：パスが別れる層において、中央によっている方が優先度が高い。
  ///
  ///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
  ///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。

  IsCurrentPriorityHeigherProvider call(NodePath current, NodePath target) =>
      IsCurrentPriorityHeigherProvider._(
        argument: (current, target),
        from: this,
      );

  @override
  String toString() => r'isCurrentPriorityHeigherProvider';
}

///currentがtargetに対して優先度が高いかどうかを判定する。同値の場合もfalseを返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。

abstract class _$IsCurrentPriorityHeigher extends $Notifier<bool> {
  late final _$args = ref.$arg as (NodePath, NodePath);
  NodePath get current => _$args.$1;
  NodePath get target => _$args.$2;

  bool build(NodePath current, NodePath target);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args.$1, _$args.$2);
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
