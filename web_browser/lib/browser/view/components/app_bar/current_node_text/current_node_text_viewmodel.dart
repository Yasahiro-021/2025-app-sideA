import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/view_model/notifiers/current_node_provider.dart';

part 'current_node_text_viewmodel.g.dart';

/// CurrentNodeTextのViewModel
/// 
/// 現在のノード名を取得して提供
@riverpod
class CurrentNodeTextViewModel extends _$CurrentNodeTextViewModel {
  @override
  CurrentNodeTextViewModel build() {
    return this;
  }

  /// 現在のノード名を取得
  String get currentNodeName {
    final currentNode = ref.watch(currentNodeProviderProvider);
    return currentNode.title;
  }
}