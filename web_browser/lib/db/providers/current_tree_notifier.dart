import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'current_tree_notifier.g.dart';

/// 現在選択されているツリーのIDを管理するNotifier
/// 
/// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
/// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。
@Riverpod(keepAlive: true)
class CurrentTreeNotifier extends _$CurrentTreeNotifier {
  /// デフォルトツリーのID
  static const int defaultTreeId = 1;

  @override
  int build() {
    // 初期状態ではデフォルトツリーを選択
    return defaultTreeId;
  }

  /// 現在のツリーを変更
  /// 
  /// ツリーを切り替える際に以下の処理を行う:
  /// 1. 現在のパスをルートにリセット（異なるツリーでは同じパスが存在しない可能性があるため）
  /// 2. BrowserNodeのキャッシュを無効化（新しいツリーのデータを取得するため）
  /// 3. ツリーIDを更新
  void setCurrentTree(int treeId) {
    if (state == treeId) {
      // 同じツリーが選択された場合は何もしない
      return;
    }

    // 現在のパスをルートにリセット
    // NodePath.rootはどのツリーでも存在する特別な値
    ref.read(currentPathProvider.notifier).changePath(NodePath.root);
    
    // BrowserNodeのキャッシュを無効化
    // これにより、新しいツリーのデータが取得される
    ref.invalidate(browserNodeFromPathProvider);
    
    // ツリーIDを更新
    state = treeId;
  }

  /// デフォルトツリーにリセット
  void resetToDefault() {
    setCurrentTree(defaultTreeId);
  }
}
