// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_group_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FollowGroupManager)
const followGroupManagerProvider = FollowGroupManagerFamily._();

final class FollowGroupManagerProvider
    extends $NotifierProvider<FollowGroupManager, NodePath> {
  const FollowGroupManagerProvider._({
    required FollowGroupManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'followGroupManagerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$followGroupManagerHash();

  @override
  String toString() {
    return r'followGroupManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FollowGroupManager create() => FollowGroupManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NodePath value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodePath>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FollowGroupManagerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$followGroupManagerHash() =>
    r'de21f01ebe48841e5a989e2c007a1641ea4d94bc';

final class FollowGroupManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          FollowGroupManager,
          NodePath,
          NodePath,
          NodePath,
          NodePath
        > {
  const FollowGroupManagerFamily._()
    : super(
        retry: null,
        name: r'followGroupManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FollowGroupManagerProvider call(NodePath parentPath) =>
      FollowGroupManagerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'followGroupManagerProvider';
}

abstract class _$FollowGroupManager extends $Notifier<NodePath> {
  late final _$args = ref.$arg as NodePath;
  NodePath get parentPath => _$args;

  NodePath build(NodePath parentPath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<NodePath, NodePath>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NodePath, NodePath>,
              NodePath,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
