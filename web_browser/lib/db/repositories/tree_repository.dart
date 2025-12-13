import '../dao/tree_dao.dart';
import '../models/tree_model.dart';

/// Treeのリポジトリクラス
/// 
/// ViewModelからの呼び出しを受け、DAOを通じてデータベース操作を行う
/// 複数ツリーの管理（作成、取得、更新、削除）を担当
class TreeRepository {
  final TreeDao _treeDao = TreeDao();

  /// 新しいツリーを作成
  /// 
  /// 作成されたツリーのIDを返す
  Future<int> createTree(String name) async {
    final tree = TreeModel(name: name);
    return await _treeDao.insert(tree);
  }

  /// IDでツリーを取得
  Future<TreeModel?> getTreeById(int id) async {
    return await _treeDao.getById(id);
  }

  /// 名前でツリーを取得
  Future<TreeModel?> getTreeByName(String name) async {
    return await _treeDao.getByName(name);
  }

  /// 全ツリーを取得（更新日時の新しい順）
  Future<List<TreeModel>> getAllTrees() async {
    return await _treeDao.getAll();
  }

  /// ツリー名を更新
  Future<void> renameTree(int id, String newName) async {
    final tree = await _treeDao.getById(id);
    if (tree == null) {
      throw ArgumentError('指定されたIDのツリーが存在しません: $id');
    }
    await _treeDao.update(tree.copyWith(name: newName));
  }

  /// ツリーの更新日時を更新（ノード変更時などに呼び出す）
  Future<void> touchTree(int id) async {
    await _treeDao.touch(id);
  }

  /// ツリーを削除（関連するノードも連鎖削除）
  Future<void> deleteTree(int id) async {
    await _treeDao.delete(id);
  }

  /// 全ツリーを削除
  Future<void> clearAll() async {
    await _treeDao.deleteAll();
  }
}
