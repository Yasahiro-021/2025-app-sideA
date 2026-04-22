import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/tree/tree_id.dart';
import 'package:web_browser/db/models/request_node_header.dart';

import 'node_repository.dart';

class TreeAwareNodeRepository {
  final NodeRepository _nodeRepository;
  final TreeId _currentTreeId;

  TreeAwareNodeRepository({
    required NodeRepository nodeRepository,
    required TreeId currentTreeId,
  }) : _nodeRepository = nodeRepository,
       _currentTreeId = currentTreeId;

  RequestNodeHeader _headerGenerator(NodePath path) =>
      RequestNodeHeader(path: path, treeId: _currentTreeId);

  Future<void> saveNode(NodePath path, BrowserNode node) async {
    await _nodeRepository.saveNode(_headerGenerator(path), node);
  }

  Future<void> saveNodes(Map<NodePath, BrowserNode> requests) async {
    Map<RequestNodeHeader, BrowserNode> convertedReqs = requests.map(
      (path, node) => MapEntry(_headerGenerator(path), node),
    );

    await _nodeRepository.saveNodes(convertedReqs);
  }

  Future<BrowserNode?> getNode(NodePath path) =>
      _nodeRepository.getNode(_headerGenerator(path));

  /// 指定ツリーの全ノードをMap形式で取得
  Future<Map<NodePath, BrowserNode>> getAllNodes(NodePath path) =>
      _nodeRepository.getAllNodes(_headerGenerator(path));

  /// ルートノードを取得
  Future<BrowserNode?> getRootNode(NodePath path) =>
      _nodeRepository.getRootNode(_headerGenerator(path));

  /// 指定パスの直接の子ノードのパスリストを取得
  Future<NodeChildren> getChildrenPaths(NodePath path) =>
      _nodeRepository.getChildrenPaths(_headerGenerator(path));

  /// 指定ノードの直接の子ノードをMap形式で取得
  Future<Map<NodePath, BrowserNode>> getChildrenNodes(NodePath path) =>
      _nodeRepository.getChildrenNodes(_headerGenerator(path));

  /// ノードを更新
  Future<void> updateNode(NodePath path, BrowserNode node) =>
      _nodeRepository.updateNode(_headerGenerator(path), node);

  /// パスでノードを削除
  Future<void> deleteNode(NodePath path) =>
      _nodeRepository.deleteNode(_headerGenerator(path));

  /// パスでノードとその子孫を全て削除
  Future<void> deleteNodeWithDescendants(NodePath path) =>
      _nodeRepository.deleteNodeWithDescendants(_headerGenerator(path));

  /// 指定ツリーの全データを削除
  Future<void> clearAllByTreeId(TreeId treeId) =>
      _nodeRepository.clearAllByTreeId(treeId);

  /// 全データを削除（全ツリー）
  Future<void> clearAll() async => _nodeRepository.clearAll();
}
