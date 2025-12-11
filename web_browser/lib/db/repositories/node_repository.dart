import '../dao/node_dao.dart';
import '../models/node_model.dart';
import '../../node/node.dart';

/// Nodeのリポジトリクラス
/// 
/// ViewModelからの呼び出しを受け、DAOを通じてデータベース操作を行う
/// Nodeモデル（ドメイン）とNodeModel（DB）間の変換も担当
class NodeRepository {
  final NodeDao _nodeDao = NodeDao();

  /// ツリー全体を保存
  /// 
  /// 既存データを削除してから新規保存
  Future<void> saveTree(Node rootNode) async {
    await _nodeDao.deleteAll();
    await _saveNodeRecursively(rootNode, null);
  }

  /// ノードを再帰的に保存
  Future<void> _saveNodeRecursively(Node node, int? parentId) async {
    final nodeModel = NodeModel(
      name: node.name,
      parentId: parentId,
    );
    final insertedId = await _nodeDao.insert(nodeModel);

    // 子ノードを再帰的に保存
    for (final child in node.children) {
      await _saveNodeRecursively(child, insertedId);
    }
  }

  /// ツリー全体を読み込み
  /// 
  /// ルートノードがない場合はnullを返す
  Future<Node?> loadTree() async {
    final rootNodes = await _nodeDao.getRootNodes();
    if (rootNodes.isEmpty) return null;

    // 最初のルートノードをツリーのルートとして使用
    final rootModel = rootNodes.first;
    return await _buildNodeRecursively(rootModel, null);
  }

  /// NodeModelからNodeを再帰的に構築
  Future<Node> _buildNodeRecursively(NodeModel model, Node? parent) async {
    final node = Node(model.name, parent);

    // 子ノードを取得して再帰的に構築
    if (model.id != null) {
      final childModels = await _nodeDao.getChildrenByParentId(model.id!);
      for (final childModel in childModels) {
        await _buildNodeRecursively(childModel, node);
      }
    }

    return node;
  }

  /// 単一ノードを追加
  Future<int> addNode(NodeModel node) async {
    return await _nodeDao.insert(node);
  }

  /// ノードを更新
  Future<void> updateNode(NodeModel node) async {
    await _nodeDao.update(node);
  }

  /// ノードを削除（子ノードも連鎖削除）
  Future<void> deleteNode(int id) async {
    await _nodeDao.delete(id);
  }

  /// 全データを削除
  Future<void> clearAll() async {
    await _nodeDao.deleteAll();
  }
}
