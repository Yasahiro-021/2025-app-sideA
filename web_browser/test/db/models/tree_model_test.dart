import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/db/models/tree_model.dart';

void main() {
  group('TreeModel', () {
    test('正常にインスタンスが作成できること', () {
      final tree = TreeModel(
        id: 1,
        name: 'テストツリー',
        createdAt: '2025-12-11T10:00:00',
        updatedAt: '2025-12-11T10:00:00',
      );

      expect(tree.id, 1);
      expect(tree.name, 'テストツリー');
      expect(tree.createdAt, '2025-12-11T10:00:00');
      expect(tree.updatedAt, '2025-12-11T10:00:00');
    });

    test('idとタイムスタンプなしでも作成できること', () {
      final tree = TreeModel(name: 'シンプルツリー');

      expect(tree.id, isNull);
      expect(tree.name, 'シンプルツリー');
      expect(tree.createdAt, isNull);
      expect(tree.updatedAt, isNull);
    });

    test('toMapが正しく動作すること', () {
      final tree = TreeModel(
        id: 1,
        name: 'テストツリー',
        createdAt: '2025-12-11T10:00:00',
        updatedAt: '2025-12-11T10:30:00',
      );

      final map = tree.toMap();

      expect(map['id'], 1);
      expect(map['name'], 'テストツリー');
      expect(map['created_at'], '2025-12-11T10:00:00');
      expect(map['updated_at'], '2025-12-11T10:30:00');
    });

    test('toMapでidがnullの場合はidが含まれないこと', () {
      final tree = TreeModel(
        name: 'テストツリー',
        createdAt: '2025-12-11T10:00:00',
      );

      final map = tree.toMap();

      expect(map.containsKey('id'), isFalse);
      expect(map['name'], 'テストツリー');
    });

    test('fromMapが正しく動作すること', () {
      final map = {
        'id': 1,
        'name': 'テストツリー',
        'created_at': '2025-12-11T10:00:00',
        'updated_at': '2025-12-11T10:30:00',
      };

      final tree = TreeModel.fromMap(map);

      expect(tree.id, 1);
      expect(tree.name, 'テストツリー');
      expect(tree.createdAt, '2025-12-11T10:00:00');
      expect(tree.updatedAt, '2025-12-11T10:30:00');
    });

    test('fromMapでタイムスタンプがnullの場合も正しく動作すること', () {
      final map = {
        'id': 1,
        'name': 'テストツリー',
        'created_at': null,
        'updated_at': null,
      };

      final tree = TreeModel.fromMap(map);

      expect(tree.id, 1);
      expect(tree.name, 'テストツリー');
      expect(tree.createdAt, isNull);
      expect(tree.updatedAt, isNull);
    });

    test('copyWithが正しく動作すること', () {
      final tree = TreeModel(
        id: 1,
        name: 'オリジナル',
        createdAt: '2025-12-11T10:00:00',
      );

      final copied = tree.copyWith(name: '変更後');

      expect(copied.id, 1);
      expect(copied.name, '変更後');
      expect(copied.createdAt, '2025-12-11T10:00:00');
    });

    test('copyWithで全プロパティを変更できること', () {
      final tree = TreeModel(
        id: 1,
        name: 'オリジナル',
        createdAt: '2025-12-11T10:00:00',
        updatedAt: '2025-12-11T10:00:00',
      );

      final copied = tree.copyWith(
        id: 2,
        name: '変更後',
        createdAt: '2025-12-12T10:00:00',
        updatedAt: '2025-12-12T12:00:00',
      );

      expect(copied.id, 2);
      expect(copied.name, '変更後');
      expect(copied.createdAt, '2025-12-12T10:00:00');
      expect(copied.updatedAt, '2025-12-12T12:00:00');
    });

    test('等価性が正しく判定されること', () {
      final tree1 = TreeModel(id: 1, name: 'テスト');
      final tree2 = TreeModel(id: 1, name: 'テスト');
      final tree3 = TreeModel(id: 2, name: 'テスト');
      final tree4 = TreeModel(id: 1, name: '別の名前');

      expect(tree1 == tree2, isTrue);
      expect(tree1 == tree3, isFalse);
      expect(tree1 == tree4, isFalse);
    });

    test('hashCodeが正しく生成されること', () {
      final tree1 = TreeModel(id: 1, name: 'テスト');
      final tree2 = TreeModel(id: 1, name: 'テスト');

      expect(tree1.hashCode, tree2.hashCode);
    });

    test('toStringが正しく動作すること', () {
      final tree = TreeModel(
        id: 1,
        name: 'テストツリー',
        createdAt: '2025-12-11T10:00:00',
        updatedAt: '2025-12-11T10:30:00',
      );

      expect(
        tree.toString(),
        'TreeModel(id: 1, name: テストツリー, createdAt: 2025-12-11T10:00:00, updatedAt: 2025-12-11T10:30:00)',
      );
    });
  });
}
