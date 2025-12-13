import '../dao/node_dao.dart';
import '../models/node_model.dart';
import '../../core/node/node_path.dart';
import '../../core/node/browser_node.dart';
import '../../core/node/node_children.dart';

/// Nodeのリポジトリクラス
/// 
/// ViewModelからの呼び出しを受け、DAOを通じてデータベース操作を行う
/// NodePath/BrowserNode（ドメイン）とNodeModel（DB）間の変換も担当
/// 複数ツリー対応版：treeIdを指定してノードを管理
class NodeRepository {
  final NodeDao _nodeDao = NodeDao();

  /// 単一ノードを保存（パスをキーとして）
  Future<void> saveNode(int treeId, NodePath path, BrowserNode node) async {
    final nodeModel = NodeModel(
      treeId: treeId,
      path: path.toString(),
      title: node.title,
      url: node.url,
      date: node.date,
    );
    await _nodeDao.insert(nodeModel);
  }

  /// 複数ノードを一括保存
  Future<void> saveNodes(int treeId, Map<NodePath, BrowserNode> nodes) async {
    final models = nodes.entries.map((entry) => NodeModel(
      treeId: treeId,
      path: entry.key.toString(),
      title: entry.value.title,
      url: entry.value.url,
      date: entry.value.date,
    )).toList();
    await _nodeDao.insertAll(models);
  }

  /// パスでノードを取得
  Future<BrowserNode?> getNodeByPath(int treeId, NodePath path) async {
    final model = await _nodeDao.getByPath(treeId, path.toString());
    if (model == null) return null;
    return BrowserNode(
      title: model.title,
      url: model.url,
      date: model.date,
    );
  }

  /// 指定ツリーの全ノードをMap形式で取得
  Future<Map<NodePath, BrowserNode>> getAllNodes(int treeId) async {
    final models = await _nodeDao.getAllByTreeId(treeId);
    final result = <NodePath, BrowserNode>{};
    for (final model in models) {
      final path = NodePath.fromString(model.path);
      result[path] = BrowserNode(
        title: model.title,
        url: model.url,
        date: model.date,
      );
    }
    return result;
  }

  /// ルートノードを取得
  Future<BrowserNode?> getRootNode(int treeId) async {
    final model = await _nodeDao.getRootNode(treeId);
    if (model == null) return null;
    return BrowserNode(
      title: model.title,
      url: model.url,
      date: model.date,
    );
  }

  /// 指定パスの直接の子ノードのパスリストを取得
  Future<NodeChildren> getChildrenPaths(int treeId, NodePath parentPath) async {
    final models = await _nodeDao.getChildrenByParentPath(treeId, parentPath.toString());
    final childPaths = models
        .map((model) => NodePath.fromString(model.path))
        .toList();
    return NodeChildren(children: childPaths);
  }

  /// 指定パスの直接の子ノードをMap形式で取得
  Future<Map<NodePath, BrowserNode>> getChildrenNodes(int treeId, NodePath parentPath) async {
    final models = await _nodeDao.getChildrenByParentPath(treeId, parentPath.toString());
    final result = <NodePath, BrowserNode>{};
    for (final model in models) {
      final path = NodePath.fromString(model.path);
      result[path] = BrowserNode(
        title: model.title,
        url: model.url,
        date: model.date,
      );
    }
    return result;
  }

  /// ノードを更新
  Future<void> updateNode(int treeId, NodePath path, BrowserNode node) async {
    final nodeModel = NodeModel(
      treeId: treeId,
      path: path.toString(),
      title: node.title,
      url: node.url,
      date: node.date,
    );
    await _nodeDao.updateByPath(treeId, nodeModel);
  }

  /// パスでノードを削除
  Future<void> deleteNode(int treeId, NodePath path) async {
    await _nodeDao.deleteByPath(treeId, path.toString());
  }

  /// パスでノードとその子孫を全て削除
  Future<void> deleteNodeWithDescendants(int treeId, NodePath path) async {
    await _nodeDao.deleteWithDescendants(treeId, path.toString());
  }

  /// 指定ツリーの全データを削除
  Future<void> clearAllByTreeId(int treeId) async {
    await _nodeDao.deleteAllByTreeId(treeId);
  }

  /// 全データを削除（全ツリー）
  Future<void> clearAll() async {
    await _nodeDao.deleteAll();
  }
}
