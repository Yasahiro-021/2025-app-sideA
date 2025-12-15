// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupManager)
const groupManagerProvider = GroupManagerFamily._();

final class GroupManagerProvider
    extends $NotifierProvider<GroupManager, Group> {
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

String _$groupManagerHash() => r'267a4179f894aebc4ea996bb942c9d7be85be445';

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

  GroupManagerProvider call(NodePath parentPath) =>
      GroupManagerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'groupManagerProvider';
}

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
