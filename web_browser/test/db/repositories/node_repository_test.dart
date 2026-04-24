import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/tree/tree_id.dart';
import 'package:web_browser/db/dao/node_dao.dart';
import 'package:web_browser/db/models/node_model.dart';
import 'package:web_browser/db/models/request_node_header.dart';
import 'package:web_browser/db/repositories/node_repository.dart';

// NodeRepositoryのテスト
// NodeDaoをモック化
class FakeNodeDao extends NodeDao {
  NodeModel? inserted;
  List<NodeModel>? insertedAll;
  NodeModel? byPathResult;
  List<NodeModel> allByTreeIdResult = [];
  List<NodeModel> childrenResult = [];
  int updateCalled = 0;
  int deleteCalled = 0;
  int deleteDescCalled = 0;
  int deleteAllByTreeCalled = 0;
  int deleteAllCalled = 0;

  @override
  Future<int> insert(NodeModel node) async {
    inserted = node;
    return 1;
  }

  @override
  Future<void> insertAll(List<NodeModel> nodes) async {
    insertedAll = nodes;
  }

  @override
  Future<NodeModel?> getByPath(int treeId, String path) async => byPathResult;

  @override
  Future<List<NodeModel>> getAllByTreeId(int treeId) async => allByTreeIdResult;

  @override
  Future<List<NodeModel>> getChildrenByParentPath(
    int treeId,
    String parentPath,
  ) async => childrenResult;

  @override
  Future<int> updateByPath(int treeId, NodeModel node) async {
    updateCalled++;
    return 1;
  }

  @override
  Future<int> deleteByPath(int treeId, String path) async {
    deleteCalled++;
    return 1;
  }

  @override
  Future<int> deleteWithDescendants(int treeId, String path) async {
    deleteDescCalled++;
    return 1;
  }

  @override
  Future<int> deleteAllByTreeId(int treeId) async {
    deleteAllByTreeCalled++;
    return 1;
  }

  @override
  Future<int> deleteAll() async {
    deleteAllCalled++;
    return 1;
  }
}

void main() {
  late FakeNodeDao dao;
  late NodeRepository repository;
  final header = RequestNodeHeader(
    path: NodePath(path: [0, 1]),
    treeId: TreeId(10),
  );
  final node = BrowserNode(
    title: 'title',
    url: 'https://example.com',
    date: '2026-04-23',
  );

  setUp(() {
    dao = FakeNodeDao();
    repository = NodeRepository(nodeDao: dao);
  });

  test('saveNodeはNodeModelへ変換して保存する', () async {
    await repository.saveNode(header, node);

    final saved = dao.inserted!;
    expect(saved.treeId, 10);
    expect(saved.path, '/0/1');
    expect(saved.title, 'title');
    expect(saved.url, 'https://example.com');
    expect(saved.date, '2026-04-23');
  });

  test('getNodeはDAO結果をBrowserNodeに変換する', () async {
    dao.byPathResult = NodeModel(
      treeId: 10,
      path: '/0/1',
      title: 'n',
      url: 'u',
      date: 'd',
    );

    final result = await repository.getNode(header);

    expect(result, isNotNull);
    expect(result!.title, 'n');
    expect(result.url, 'u');
    expect(result.date, 'd');
  });

  test('getAllNodesとgetChildrenPathsはパスを復元して返す', () async {
    dao.allByTreeIdResult = [
      NodeModel(treeId: 10, path: '/0/1', title: 'a', url: 'u1'),
    ];
    dao.childrenResult = [
      NodeModel(treeId: 10, path: '/0/1/0', title: 'c1', url: 'u2'),
      NodeModel(treeId: 10, path: '/0/1/1', title: 'c2', url: 'u3'),
    ];

    final all = await repository.getAllNodes(header);
    final children = await repository.getChildrenPaths(header);

    expect(all.containsKey(NodePath(path: [0, 1])), isTrue);
    expect(children.children, [
      NodePath(path: [0, 1, 0]),
      NodePath(path: [0, 1, 1]),
    ]);
  });

  test('update/delete/clear系はDAOに委譲する', () async {
    await repository.updateNode(header, node);
    await repository.deleteNode(header);
    await repository.deleteNodeWithDescendants(header);
    await repository.clearAllByTreeId(TreeId(10));
    await repository.clearAll();

    expect(dao.updateCalled, 1);
    expect(dao.deleteCalled, 1);
    expect(dao.deleteDescCalled, 1);
    expect(dao.deleteAllByTreeCalled, 1);
    expect(dao.deleteAllCalled, 1);
  });
}
