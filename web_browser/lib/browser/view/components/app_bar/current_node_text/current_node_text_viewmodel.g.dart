// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_node_text_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// CurrentNodeTextのViewModel
///
/// 現在のノード名を取得して提供

@ProviderFor(CurrentNodeTextViewModel)
const currentNodeTextViewModelProvider = CurrentNodeTextViewModelProvider._();

/// CurrentNodeTextのViewModel
///
/// 現在のノード名を取得して提供
final class CurrentNodeTextViewModelProvider
    extends
        $NotifierProvider<CurrentNodeTextViewModel, CurrentNodeTextViewModel> {
  /// CurrentNodeTextのViewModel
  ///
  /// 現在のノード名を取得して提供
  const CurrentNodeTextViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentNodeTextViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentNodeTextViewModelHash();

  @$internal
  @override
  CurrentNodeTextViewModel create() => CurrentNodeTextViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CurrentNodeTextViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CurrentNodeTextViewModel>(value),
    );
  }
}

String _$currentNodeTextViewModelHash() =>
    r'797c783b0e39a4bed7aa709eff57f97dd07b010a';

/// CurrentNodeTextのViewModel
///
/// 現在のノード名を取得して提供

abstract class _$CurrentNodeTextViewModel
    extends $Notifier<CurrentNodeTextViewModel> {
  CurrentNodeTextViewModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<CurrentNodeTextViewModel, CurrentNodeTextViewModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CurrentNodeTextViewModel, CurrentNodeTextViewModel>,
              CurrentNodeTextViewModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
