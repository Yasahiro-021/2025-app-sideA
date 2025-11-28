// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_node_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ChildNodeのViewModel
///
/// 子ノードへの遷移処理を管理

@ProviderFor(ChildNodeViewModel)
const childNodeViewModelProvider = ChildNodeViewModelFamily._();

/// ChildNodeのViewModel
///
/// 子ノードへの遷移処理を管理
final class ChildNodeViewModelProvider
    extends $NotifierProvider<ChildNodeViewModel, ChildNodeViewModel> {
  /// ChildNodeのViewModel
  ///
  /// 子ノードへの遷移処理を管理
  const ChildNodeViewModelProvider._({
    required ChildNodeViewModelFamily super.from,
    required NodePath super.argument,
  }) : super(
         retry: null,
         name: r'childNodeViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$childNodeViewModelHash();

  @override
  String toString() {
    return r'childNodeViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChildNodeViewModel create() => ChildNodeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChildNodeViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChildNodeViewModel>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChildNodeViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$childNodeViewModelHash() =>
    r'1105d66cbe7197c97684ba72160dd381b2cbc183';

/// ChildNodeのViewModel
///
/// 子ノードへの遷移処理を管理

final class ChildNodeViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ChildNodeViewModel,
          ChildNodeViewModel,
          ChildNodeViewModel,
          ChildNodeViewModel,
          NodePath
        > {
  const ChildNodeViewModelFamily._()
    : super(
        retry: null,
        name: r'childNodeViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// ChildNodeのViewModel
  ///
  /// 子ノードへの遷移処理を管理

  ChildNodeViewModelProvider call(NodePath nodePath) =>
      ChildNodeViewModelProvider._(argument: nodePath, from: this);

  @override
  String toString() => r'childNodeViewModelProvider';
}

/// ChildNodeのViewModel
///
/// 子ノードへの遷移処理を管理

abstract class _$ChildNodeViewModel extends $Notifier<ChildNodeViewModel> {
  late final _$args = ref.$arg as NodePath;
  NodePath get nodePath => _$args;

  ChildNodeViewModel build(NodePath nodePath);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ChildNodeViewModel, ChildNodeViewModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChildNodeViewModel, ChildNodeViewModel>,
              ChildNodeViewModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
