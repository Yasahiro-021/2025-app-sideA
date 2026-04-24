import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/core/tree/tree_name.dart';
import 'package:web_browser/db/dao/tree_dao.dart';
import 'package:web_browser/db/models/tree_model.dart';
import 'package:web_browser/db/repositories/tree_repository.dart';

class FakeTreeDao extends TreeDao {
  TreeModel? inserted;
  TreeModel? byId;
  TreeModel? byName;
  List<TreeModel> list = [];
  TreeModel? updated;
  int touched = 0;
  int deleted = 0;
  int cleared = 0;

  @override
  Future<int> insert(TreeModel tree) async {
    inserted = tree;
    return 7;
  }

  @override
  Future<TreeModel?> getById(int id) async => byId;

  @override
  Future<TreeModel?> getByName(String name) async => byName;

  @override
  Future<List<TreeModel>> get({int? limit}) async => list;

  @override
  Future<int> update(TreeModel tree) async {
    updated = tree;
    return 1;
  }

  @override
  Future<void> touch(int treeId) async {
    touched++;
  }

  @override
  Future<int> delete(int id) async {
    deleted++;
    return 1;
  }

  @override
  Future<int> deleteAll() async {
    cleared++;
    return 1;
  }
}

void main() {
  late FakeTreeDao dao;
  late TreeRepository repository;

  setUp(() {
    dao = FakeTreeDao();
    repository = TreeRepository(treeDao: dao);
  });

  test('createTreeはTreeModelを作成してDAOへ渡す', () async {
    final id = await repository.createTree(TreeName('新規ツリー'));

    expect(id, 7);
    final model = dao.inserted!;
    expect(model.name, '新規ツリー');
  });

  test('取得系APIはDAOの戻り値をそのまま返す', () async {
    final tree = TreeModel(id: 1, name: 'A');
    dao.byId = tree;
    dao.byName = tree;
    dao.list = [tree];

    expect(await repository.getTreeById(1), tree);
    expect(await repository.getTreeByName('A'), tree);
    expect(await repository.getAllTrees(), [tree]);
    expect(await repository.getRecentTrees(limit: 2), [tree]);
  });

  test('renameTreeは名前更新したモデルでDAOを呼ぶ', () async {
    dao.byId = TreeModel(id: 3, name: 'before');

    await repository.renameTree(3, 'after');

    final updated = dao.updated!;
    expect(updated.id, 3);
    expect(updated.name, 'after');
  });

  test('renameTreeは対象がないとArgumentErrorを投げる', () async {
    dao.byId = null;

    expect(() => repository.renameTree(99, 'x'), throwsA(isA<ArgumentError>()));
    expect(dao.updated, isNull);
  });

  test('touch/delete/clearはDAOに委譲する', () async {
    await repository.touchTree(1);
    await repository.deleteTree(1);
    await repository.clearAll();

    expect(dao.touched, 1);
    expect(dao.deleted, 1);
    expect(dao.cleared, 1);
  });
}
