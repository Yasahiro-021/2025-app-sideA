import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/node/node_path.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_children_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';

part 'bottom_node_list_view_model.g.dart';

/// BottomNodeListのViewModel
@riverpod
List<NodePath> bottomNodeListViewModel(Ref ref) {
  //現在のパスを取得
  final NodePath currentPath = ref.watch(currentPathProvider);

  //現在パスの子を取得
  final List<NodePath> bottomPathes = ref.watch(browserNodeChildrenProvider(currentPath)).children;

  return bottomPathes;
}
