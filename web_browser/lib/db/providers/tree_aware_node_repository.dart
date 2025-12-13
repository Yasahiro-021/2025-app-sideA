import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_children.dart';
import '../repositories/node_repository.dart';
import 'current_tree_notifier.dart';

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
  int get _currentTreeId => ref.read(currentTreeNotifierProvider);

  /// 単一ノードを保存（現在のツリーに）
  Future<void> saveNode(NodePath path, BrowserNode node) async {
    await _nodeRepository.saveNode(_currentTreeId, path, node);
  }

  /// 複数ノードを一括保存（現在のツリーに）
  Future<void> saveNodes(Map<NodePath, BrowserNode> nodes) async {
    await _nodeRepository.saveNodes(_currentTreeId, nodes);
  }

  /// パスでノードを取得（現在のツリーから）
  Future<BrowserNode?> getNodeByPath(NodePath path) async {
    return await _nodeRepository.getNodeByPath(_currentTreeId, path);
  }

  /// 全ノードをMap形式で取得（現在のツリーから）
  Future<Map<NodePath, BrowserNode>> getAllNodes() async {
    return await _nodeRepository.getAllNodes(_currentTreeId);
  }

  /// ルートノードを取得（現在のツリーから）
  Future<BrowserNode?> getRootNode() async {
    return await _nodeRepository.getRootNode(_currentTreeId);
  }

  /// 指定パスの直接の子ノードのパスリストを取得（現在のツリーから）
  Future<NodeChildren> getChildrenPaths(NodePath parentPath) async {
    return await _nodeRepository.getChildrenPaths(_currentTreeId, parentPath);
  }

  /// 指定パスの直接の子ノードをMap形式で取得（現在のツリーから）
  Future<Map<NodePath, BrowserNode>> getChildrenNodes(NodePath parentPath) async {
    return await _nodeRepository.getChildrenNodes(_currentTreeId, parentPath);
  }

  /// ノードを更新（現在のツリー内）
  Future<void> updateNode(NodePath path, BrowserNode node) async {
    await _nodeRepository.updateNode(_currentTreeId, path, node);
  }

  /// パスでノードを削除（現在のツリーから）
  Future<void> deleteNode(NodePath path) async {
    await _nodeRepository.deleteNode(_currentTreeId, path);
  }

  /// パスでノードとその子孫を全て削除（現在のツリーから）
  Future<void> deleteNodeWithDescendants(NodePath path) async {
    await _nodeRepository.deleteNodeWithDescendants(_currentTreeId, path);
  }

  /// 現在のツリーの全データを削除
  Future<void> clearCurrentTree() async {
    await _nodeRepository.clearAllByTreeId(_currentTreeId);
  }
}
