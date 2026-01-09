import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_browser/browser/view_model/notifiers/current_path_notifier.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'current_tree_notifier.g.dart';

/// SharedPreferencesの永続化キー
const String _currentTreeIdKey = 'current_tree_id';

/// 現在選択されているツリーのIDを管理するNotifier
/// 
/// 複数ツリー対応において、アプリ全体で「現在どのツリーを操作しているか」を
/// 一元管理する。各Providerはこの値を参照して適切なツリーのデータを返す。
/// ツリーIDはSharedPreferencesに永続化される。
@Riverpod(keepAlive: true)
class CurrentTreeNotifier extends _$CurrentTreeNotifier {
  /// デフォルトツリーのID
  static const int defaultTreeId = 1;

  @override
  Future<int> build() async {
    final prefs = await SharedPreferences.getInstance();
    // SharedPreferencesから値を読み込み、存在しない場合はデフォルト値を使用
    return prefs.getInt(_currentTreeIdKey) ?? defaultTreeId;
  }

  /// 現在のツリーを変更
  /// 
  /// ツリーを切り替える際に以下の処理を行う:
  /// 1. 現在のパスをルートにリセット（異なるツリーでは同じパスが存在しない可能性があるため）
  /// 2. BrowserNodeのキャッシュを無効化（新しいツリーのデータを取得するため）
  /// 3. ツリーIDを更新してSharedPreferencesに永続化
  Future<void> setCurrentTree(int treeId) async {
    final currentState = await future;
    if (currentState == treeId) {
      // 同じツリーが選択された場合は何もしない
      return;
    }

    // 現在のパスをルートにリセット
    // NodePath.rootはどのツリーでも存在する特別な値
    ref.read(currentPathProvider.notifier).changePath(NodePath.root);
    
    // BrowserNodeのキャッシュを無効化
    // これにより、新しいツリーのデータが取得される
    ref.invalidate(browserNodeFromPathProvider);
    
    // ツリーIDをSharedPreferencesに保存して状態を更新
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_currentTreeIdKey, treeId);
    state = AsyncValue.data(treeId);
  }

  /// デフォルトツリーにリセット
  Future<void> resetToDefault() async {
    await setCurrentTree(defaultTreeId);
  }
}
