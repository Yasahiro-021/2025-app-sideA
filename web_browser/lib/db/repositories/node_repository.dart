import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/tree/tree_id.dart';

import '../dao/node_dao.dart';
import '../models/node_model.dart';
import '../../core/node/node_path.dart';
import '../models/request_node_header.dart';

/// Nodeのリポジトリクラス
///
/// Nodeクラスのデータベース操作を担当
/// 指定のない場合は、通常のNodeDaoを使用する。
class NodeRepository {
  final NodeDao _nodeDao; //データベースにアクセスするオブジェクト

  NodeRepository({NodeDao? nodeDao})
    : _nodeDao = nodeDao ?? NodeDao(); //指定の無い場合は、そのままDAOを使用する。

  /// 単一ノードを保存（パスをキーとして）
  Future<void> saveNode(RequestNodeHeader header, BrowserNode node) async {
    final nodeModel = NodeModel(
      treeId: header.treeId.id,
      path: header.path.toString(), //NodePathを文字列に変換
      title: node.title,
      url: node.url,
      date: node.date,
    );
    await _nodeDao.insert(nodeModel);
  }

  /// 複数ノードを一括保存
  Future<void> saveNodes(Map<RequestNodeHeader, BrowserNode> requests) async {
    final models = requests.entries
        .map(
          (entry) => NodeModel(
            treeId: entry.key.treeId.id,
            path: entry.key.toString(),
            title: entry.value.title,
            url: entry.value.url,
            date: entry.value.date,
          ),
        )
        .toList();
    await _nodeDao.insertAll(models);
  }

  /// パスでノードを取得
  Future<BrowserNode?> getNode(RequestNodeHeader header) async {
    final NodeModel? model = await _nodeDao.getByPath(
      header.treeId.id,
      header.path.toString(),
    );
    if (model == null) return null;
    return BrowserNode(title: model.title, url: model.url, date: model.date);
  }

  /// 指定ツリーの全ノードをMap形式で取得
  Future<Map<NodePath, BrowserNode>> getAllNodes(
    RequestNodeHeader header,
  ) async {
    final models = await _nodeDao.getAllByTreeId(header.treeId.id);
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
  Future<BrowserNode?> getRootNode(RequestNodeHeader header) async {
    final model = await _nodeDao.getRootNode(header.treeId.id);
    if (model == null) return null;
    return BrowserNode(title: model.title, url: model.url, date: model.date);
  }

  /// 指定パスの直接の子ノードのパスリストを取得
  Future<NodeChildren> getChildrenPaths(RequestNodeHeader header) async {
    final models = await _nodeDao.getChildrenByParentPath(
      header.treeId.id,
      header.path.toString(),
    );
    final childPaths = models
        .map((model) => NodePath.fromString(model.path))
        .toList();
    return NodeChildren(children: childPaths);
  }

  /// 指定ノードの直接の子ノードをMap形式で取得
  Future<Map<NodePath, BrowserNode>> getChildrenNodes(
    RequestNodeHeader header,
  ) async {
    final models = await _nodeDao.getChildrenByParentPath(
      header.treeId.id,
      header.path.toString(),
    );
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
  Future<void> updateNode(RequestNodeHeader header, BrowserNode node) async {
    final nodeModel = NodeModel(
      treeId: header.treeId.id,
      path: header.path.toString(),
      title: node.title,
      url: node.url,
      date: node.date,
    );
    await _nodeDao.updateByPath(header.treeId.id, nodeModel);
  }

  /// パスでノードを削除
  Future<void> deleteNode(RequestNodeHeader header) async {
    await _nodeDao.deleteByPath(header.treeId.id, header.path.toString());
  }

  /// パスでノードとその子孫を全て削除
  Future<void> deleteNodeWithDescendants(RequestNodeHeader header) async {
    await _nodeDao.deleteWithDescendants(
      header.treeId.id,
      header.path.toString(),
    );
  }

  /// 指定ツリーの全データを削除
  Future<void> clearAllByTreeId(TreeId treeId) async {
    await _nodeDao.deleteAllByTreeId(treeId.id);
  }

  /// 全データを削除（全ツリー）
  Future<void> clearAll() async {
    await _nodeDao.deleteAll();
  }
}
