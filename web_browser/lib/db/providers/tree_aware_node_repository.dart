import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/providers/current_tree_notifier.dart';
import '../repositories/node_repository.dart';

part 'tree_aware_node_repository.g.dart';

/// 現在選択されているツリーに基づいてノードを操作するリポジトリ
/// 
/// CurrentTreeNotifierが示すtreeIdを自動的に使用し、
/// 既存のコードがツリーIDを意識せずにノード操作できるようにする
@Riverpod(keepAlive: true)
class TreeAwareNodeRepository extends _$TreeAwareNodeRepository {
  late final NodeRepository _nodeRepository;

  @override
  NodeRepository build() {
    _nodeRepository = NodeRepository();
    return _nodeRepository;
  }

  /// 現在のツリーIDを取得
  Future<int> get _currentTreeId => ref.read(currentTreeProvider.future);

  /// 単一ノードを保存（現在のツリーに）
  Future<void> saveNode(NodePath path, BrowserNode node) async {
    final treeId = await _currentTreeId;
    await _nodeRepository.saveNode(treeId, path, node);
  }

  /// 複数ノードを一括保存（現在のツリーに）
  Future<void> saveNodes(Map<NodePath, BrowserNode> nodes) async {
    final treeId = await _currentTreeId;
    await _nodeRepository.saveNodes(treeId, nodes);
  }

  /// パスでノードを取得（現在のツリーから）
  Future<BrowserNode?> getNodeByPath(NodePath path) async {
    final treeId = await _currentTreeId;
    return await _nodeRepository.getNodeByPath(treeId, path);
  }

  /// 全ノードをMap形式で取得（現在のツリーから）
  Future<Map<NodePath, BrowserNode>> getAllNodes() async {
    final treeId = await _currentTreeId;
    return await _nodeRepository.getAllNodes(treeId);
  }

  /// ルートノードを取得（現在のツリーから）
  Future<BrowserNode?> getRootNode() async {
    final treeId = await _currentTreeId;
    return await _nodeRepository.getRootNode(treeId);
  }

  /// 指定パスの直接の子ノードのパスリストを取得（現在のツリーから）
  Future<NodeChildren> getChildrenPaths(NodePath parentPath) async {
    final treeId = await _currentTreeId;
    return await _nodeRepository.getChildrenPaths(treeId, parentPath);
  }

  /// 指定パスの直接の子ノードをMap形式で取得（現在のツリーから）
  Future<Map<NodePath, BrowserNode>> getChildrenNodes(NodePath parentPath) async {
    final treeId = await _currentTreeId;
    return await _nodeRepository.getChildrenNodes(treeId, parentPath);
  }

  /// ノードを更新（現在のツリー内）
  Future<void> updateNode(NodePath path, BrowserNode node) async {
    final treeId = await _currentTreeId;
    await _nodeRepository.updateNode(treeId, path, node);
  }

  /// パスでノードを削除（現在のツリーから）
  Future<void> deleteNode(NodePath path) async {
    final treeId = await _currentTreeId;
    await _nodeRepository.deleteNode(treeId, path);
  }

  /// パスでノードとその子孫を全て削除（現在のツリーから）
  Future<void> deleteNodeWithDescendants(NodePath path) async {
    final treeId = await _currentTreeId;
    await _nodeRepository.deleteNodeWithDescendants(treeId, path);
  }

  /// 現在のツリーの全データを削除
  Future<void> clearCurrentTree() async {
    final treeId = await _currentTreeId;
    await _nodeRepository.clearAllByTreeId(treeId);
  }
}
