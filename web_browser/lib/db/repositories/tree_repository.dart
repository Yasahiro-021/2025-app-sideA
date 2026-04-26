import 'package:web_browser/core/tree/tree_name.dart';

import '../dao/tree_dao.dart';
import '../models/tree_model.dart';

/// Treeのリポジトリクラス
///
/// Treeクラスのデータベース操作を担当
class TreeRepository {
  final TreeDao _dao;

  /// コンストラクタ。Daoの指定がない場合は素のTreeDaoを使用する。
  TreeRepository({TreeDao? treeDao}) : _dao = treeDao ?? TreeDao();

  /// 新しいツリーを作成
  ///
  /// 作成されたツリーのIDを返す
  Future<int> createTree(TreeName name) async {
    final tree = TreeModel(name: name.name);
    return await _dao.insert(tree);
  }

  /// IDでツリーを取得
  Future<TreeModel?> getTreeById(int id) async {
    return await _dao.getById(id);
  }

  /// 名前でツリーを取得
  Future<TreeModel?> getTreeByName(String name) async {
    return await _dao.getByName(name);
  }

  /// 全ツリーを取得（更新日時の新しい順）
  Future<List<TreeModel>> getAllTrees() async {
    return await _dao.get();
  }

  /// 更新日時の新しい順でツリーを取得（上位n件）
  Future<List<TreeModel>> getRecentTrees({int limit = 5}) async {
    return await _dao.get(limit: limit);
  }

  /// ツリー名を更新
  Future<void> renameTree(int id, String newName) async {
    final tree = await _dao.getById(id);
    if (tree == null) {
      throw ArgumentError('指定されたIDのツリーが存在しません: $id');
    }
    await _dao.update(tree.copyWith(name: newName));
  }

  /// ツリーの更新日時を更新（ノード変更時などに呼び出す）
  Future<void> touchTree(int id) async {
    await _dao.touch(id);
  }

  /// ツリーを削除（関連するノードも連鎖削除）
  Future<void> deleteTree(int id) async {
    await _dao.delete(id);
  }

  /// 全ツリーを削除
  Future<void> clearAll() async {
    await _dao.deleteAll();
  }
}
