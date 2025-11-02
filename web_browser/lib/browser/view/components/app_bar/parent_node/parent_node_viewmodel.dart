import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/model/node_with_path.dart';
import 'package:web_browser/browser/view_model/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/view_model/notifiers/webview_controller_notifier.dart';

/// ParentNodeのViewModel
/// 
/// 親ノードの情報と親ノードへの遷移処理を管理
class ParentNodeViewModel {
  final Ref ref;

  ParentNodeViewModel(this.ref);

  /// 現在のノードを取得
  NodeWithPath get currentNode => ref.watch(currentNodeNotifierProvider);

  /// 親ノードの名前を取得
  String get parentName {
    final parent = currentNode.parent;
    return parent?.name ?? '';
  }

  /// 親ノードが存在するかどうか
  bool get hasParent => currentNode.parent != null;

  /// 親ノードへ遷移
  void navigateToParent() {
    final parentNode = currentNode.parent as NodeWithPath?;
    if (parentNode == null) return;
    
    // 親ノードのURLにWebViewを遷移
    final webViewController = ref.read(webViewControllerNotifierProvider);
    webViewController?.loadUrl(urlRequest: URLRequest(url: WebUri(parentNode.url)));
    
    // 現在ノードを親ノードに変更
    ref.read(currentNodeNotifierProvider.notifier).changeNode(parentNode);
  }
}

/// ParentNodeViewModelのProvider
final parentNodeViewModelProvider = Provider((ref) {
  return ParentNodeViewModel(ref);
});
