import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/db/models/tree_model.dart';
import 'package:web_browser/db/providers/tree_repository_provider.dart';
import 'package:web_browser/home/home_page_state.dart';
import 'package:web_browser/home/model/history.dart';
part 'home_page_view_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  @override
  HomePageState build() {
    return HomePageState(
      historyList: _getTreeHistory(),
      recentHistoryList: _getRecentTreeHistory(),
    );
  }

  Future<List<History>> _getTreeHistory() async {
    //全ツリーを取得する
    Future<List<TreeModel>> treeHistory = ref
        .read(treeRepositoryProvider)
        .getAllTrees();

    List<TreeModel> trees = await treeHistory;
    return trees.map((tree) => _treeModelToHistory(tree)).toList();
  }

  Future<List<History>> _getRecentTreeHistory() async {
    //直近のツリーを５件取得する
    Future<List<TreeModel>> treeHistory = ref
        .read(treeRepositoryProvider)
        .getRecentTrees(limit: 5);

    List<TreeModel> trees = await treeHistory;
    //更新日時でソートして、上位5件を取得する
    List<TreeModel> recentTrees = trees
      ..sort((a, b) => (b.updatedAt ?? '').compareTo(a.updatedAt ?? ''));
    recentTrees = recentTrees.take(5).toList();
    return recentTrees.map((tree) => _treeModelToHistory(tree)).toList();
  }

  /// TreeModelを(DateTime,String)のタプルに変換する
  History _treeModelToHistory(TreeModel treeModel) {
    //nullの場合は空文字列を使用
    String updatedAt = treeModel.updatedAt ?? '';
    String name = treeModel.name;
    return History(name: name, date: DateTime.parse(updatedAt));
  }
}
