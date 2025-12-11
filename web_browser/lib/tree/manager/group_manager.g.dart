// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
///グループ（兄弟ノード）の幅を管理する

@ProviderFor(GroupManager)
const groupManagerProvider = GroupManagerFamily._();

///グループ（兄弟ノード）の幅を管理する
final class GroupManagerProvider
    extends $NotifierProvider<GroupManager, NodeGroup> {
  ///グループ（兄弟ノード）の幅を管理する
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
  Override overrideWithValue(NodeGroup value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NodeGroup>(value),
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

String _$groupManagerHash() => r'95cbc97dcaad671f99535fbc03df52f3983ff4c5';

///グループ（兄弟ノード）の幅を管理する

final class GroupManagerFamily extends $Family
    with
        $ClassFamilyOverride<
          GroupManager,
          NodeGroup,
          NodeGroup,
          NodeGroup,
          NodePath
        > {
  const GroupManagerFamily._()
    : super(
        retry: null,
        name: r'groupManagerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ///グループ（兄弟ノード）の幅を管理する

  GroupManagerProvider call(NodePath parentPath) =>
      GroupManagerProvider._(argument: parentPath, from: this);

  @override
  String toString() => r'groupManagerProvider';
}

///グループ（兄弟ノード）の幅を管理する

abstract class _$GroupManager extends $Notifier<NodeGroup> {
  late final _$args = ref.$arg as NodePath;
  NodePath get parentPath => _$args;

  NodeGroup build(NodePath parentPath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<NodeGroup, NodeGroup>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NodeGroup, NodeGroup>,
              NodeGroup,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
