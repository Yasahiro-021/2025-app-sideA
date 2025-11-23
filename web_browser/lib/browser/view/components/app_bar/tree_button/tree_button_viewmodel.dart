import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/domain/usecase/node_path_to_node_function.dart';
import 'package:web_browser/browser/model/node_path.dart';
import 'package:web_browser/browser/view_model/notifiers/browser_node_from_path_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/root_path_provider.dart';
import 'package:web_browser/browser/model/browser_node.dart';
import 'package:web_browser/node/node.dart';

part 'tree_button_viewmodel.g.dart';
/// TreeButtonのViewModel
/// 
/// ルートノードの状態を管理し、ツリー画面への遷移に必要なデータを提供する
@riverpod
class TreeButtonViewModel extends _$TreeButtonViewModel {
  @override
  TreeButtonViewModel build() {
    return this;
  }

  //ルートのパスを取得
  NodePath get rootPath => ref.read(rootPathProvider);

  /// ルートノードを取得
  BrowserNode get rootNode => ref.watch(browserNodeFromPathProvider(rootPath));

  /// ルートノードの名前を取得
  String get rootNodeName => rootNode.title;

  Node get rootNodeAsNode{
    return ref.read(nodeWithPathToNodeProvider)(rootPath);
  }


}