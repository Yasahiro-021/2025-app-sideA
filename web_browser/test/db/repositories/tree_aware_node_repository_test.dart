import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/core/node/browser_node.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/tree/tree_id.dart';
import 'package:web_browser/db/dao/node_dao.dart';
import 'package:web_browser/db/models/request_node_header.dart';
import 'package:web_browser/db/repositories/node_repository.dart';
import 'package:web_browser/db/repositories/tree_aware_node_repository.dart';

class SpyNodeRepository extends NodeRepository {
  SpyNodeRepository() : super(nodeDao: NodeDao());

  RequestNodeHeader? savedHeader;
  Map<RequestNodeHeader, BrowserNode>? savedMap;
  RequestNodeHeader? gotHeader;
  RequestNodeHeader? childrenHeader;
  RequestNodeHeader? deletedHeader;
  TreeId? clearedTreeId;
  int clearAllCalled = 0;

  @override
  Future<void> saveNode(RequestNodeHeader header, BrowserNode node) async {
    savedHeader = header;
  }

  @override
  Future<void> saveNodes(Map<RequestNodeHeader, BrowserNode> requests) async {
    savedMap = requests;
  }

  @override
  Future<BrowserNode?> getNode(RequestNodeHeader header) async {
    gotHeader = header;
    return BrowserNode(title: 'n', url: 'u');
  }

  @override
  Future<Map<NodePath, BrowserNode>> getChildrenNodes(RequestNodeHeader header) async {
    childrenHeader = header;
    return {NodePath(path: [2]): BrowserNode(title: 'n', url: 'u')};
  }

  @override
  Future<void> deleteNodeWithDescendants(RequestNodeHeader header) async {
    deletedHeader = header;
  }

  @override
  Future<void> clearAllByTreeId(TreeId treeId) async {
    clearedTreeId = treeId;
  }

  @override
  Future<void> clearAll() async {
    clearAllCalled++;
  }
}

void main() {
  late SpyNodeRepository nodeRepository;
  late TreeAwareNodeRepository repository;
  final currentTreeId = TreeId(5);
  final path = NodePath(path: [2]);
  final node = BrowserNode(title: 'n', url: 'u');

  setUp(() {
    nodeRepository = SpyNodeRepository();
    repository = TreeAwareNodeRepository(
      nodeRepository: nodeRepository,
      currentTreeId: currentTreeId,
    );
  });

  test('saveNodeは現在のTreeIdを使ったヘッダーで委譲する', () async {
    await repository.saveNode(path, node);

    final header = nodeRepository.savedHeader!;
    expect(header.path, path);
    expect(header.treeId, currentTreeId);
  });

  test('saveNodesは全要素をヘッダー付きに変換して委譲する', () async {
    await repository.saveNodes({path: node, NodePath(path: [3]): BrowserNode(title: 'x', url: 'y')});

    final req = nodeRepository.savedMap!;
    expect(req.length, 2);
    expect(req.keys.any((h) => h.path == path && h.treeId == currentTreeId), isTrue);
  });

  test('取得系と削除系はヘッダー変換して委譲する', () async {
    final got = await repository.getNode(path);
    final children = await repository.getChildrenNodes(path);
    await repository.deleteNodeWithDescendants(path);

    expect(got, BrowserNode(title: 'n', url: 'u'));
    expect(children[path], BrowserNode(title: 'n', url: 'u'));
    final header = nodeRepository.gotHeader!;
    expect(header.treeId, currentTreeId);
    expect(nodeRepository.childrenHeader, isNotNull);
    expect(nodeRepository.deletedHeader, isNotNull);
  });

  test('clearAllByTreeIdとclearAllはそのまま委譲する', () async {
    await repository.clearAllByTreeId(TreeId(99));
    await repository.clearAll();

    expect(nodeRepository.clearedTreeId, TreeId(99));
    expect(nodeRepository.clearAllCalled, 1);
  });
}
