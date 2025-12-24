// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///グループの自身とサブツリーの幅を管理

@ProviderFor(GroupManager)
const groupManagerProvider = GroupManagerFamily._();

///グループの自身とサブツリーの幅を管理
final class GroupManagerProvider
    extends $NotifierProvider<GroupManager, Group> {
  ///グループの自身とサブツリーの幅を管理
  const GroupManagerProvider._({
    required GroupManagerFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'groupManagerProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupManagerHash();

  @override
  String toString() {
    return r'groupManagerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GroupManager create() => GroupManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Group value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Group>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GroupManagerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupManagerHash() => r'a23b4e4d1add4e41c1d0d018047d8935d4794441';

///グループの自身とサブツリーの幅を管理

final class GroupManagerFamily extends $Family
    with $ClassFamilyOverride<GroupManager, Group, Group, Group, NodePath> {
  const GroupManagerFamily._()
    : super(
        retry: null,
        name: r'groupManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ///グループの自身とサブツリーの幅を管理

  GroupManagerProvider call(NodePath parentPath) =>
      GroupManagerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'groupManagerProvider';
}

///グループの自身とサブツリーの幅を管理

abstract class _$GroupManager extends $Notifier<Group> {
  late final _$args = ref.$arg as NodePath;
  NodePath get parentPath => _$args;

  Group build(NodePath parentPath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Group, Group>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Group, Group>,
              Group,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
