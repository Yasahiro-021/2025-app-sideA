// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_button_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// TreeButtonのViewModel
///
/// TreeButtonViewに必要な情報を処理する。

@ProviderFor(TreeButtonViewModel)
const treeButtonViewModelProvider = TreeButtonViewModelProvider._();

/// TreeButtonのViewModel
///
/// TreeButtonViewに必要な情報を処理する。
final class TreeButtonViewModelProvider
    extends $NotifierProvider<TreeButtonViewModel, TreeButtonViewModel> {
  /// TreeButtonのViewModel
  ///
  /// TreeButtonViewに必要な情報を処理する。
  const TreeButtonViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeButtonViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeButtonViewModelHash();

  @$internal
  @override
  TreeButtonViewModel create() => TreeButtonViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TreeButtonViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TreeButtonViewModel>(value),
    );
  }
}

String _$treeButtonViewModelHash() =>
    r'e820d3037bd7f7c7bec38e407d4648357ac24dd6';

/// TreeButtonのViewModel
///
/// TreeButtonViewに必要な情報を処理する。

abstract class _$TreeButtonViewModel extends $Notifier<TreeButtonViewModel> {
  TreeButtonViewModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TreeButtonViewModel, TreeButtonViewModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TreeButtonViewModel, TreeButtonViewModel>,
              TreeButtonViewModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
