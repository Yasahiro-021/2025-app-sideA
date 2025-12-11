import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/db/models/node_model.dart';

void main() {
  group('NodeModel', () {
    test('正常にインスタンスが作成できること', () {
      final node = NodeModel(
        id: 1,
        name: 'テストノード',
        parentId: null,
      );

      expect(node.id, 1);
      expect(node.name, 'テストノード');
      expect(node.parentId, isNull);
    });

    test('親IDを持つノードが作成できること', () {
      final node = NodeModel(
        id: 2,
        name: '子ノード',
        parentId: 1,
      );

      expect(node.id, 2);
      expect(node.name, '子ノード');
      expect(node.parentId, 1);
    });

    test('toMapが正しく動作すること', () {
      final node = NodeModel(
        id: 1,
        name: 'テストノード',
        parentId: 2,
      );

      final map = node.toMap();

      expect(map['id'], 1);
      expect(map['name'], 'テストノード');
      expect(map['parent_id'], 2);
    });

    test('toMapでidがnullの場合はidが含まれないこと', () {
      final node = NodeModel(
        name: 'テストノード',
        parentId: null,
      );

      final map = node.toMap();

      expect(map.containsKey('id'), isFalse);
      expect(map['name'], 'テストノード');
      expect(map['parent_id'], isNull);
    });

    test('fromMapが正しく動作すること', () {
      final map = {
        'id': 1,
        'name': 'テストノード',
        'parent_id': 2,
      };

      final node = NodeModel.fromMap(map);

      expect(node.id, 1);
      expect(node.name, 'テストノード');
      expect(node.parentId, 2);
    });

    test('fromMapでparent_idがnullの場合も正しく動作すること', () {
      final map = {
        'id': 1,
        'name': 'ルートノード',
        'parent_id': null,
      };

      final node = NodeModel.fromMap(map);

      expect(node.id, 1);
      expect(node.name, 'ルートノード');
      expect(node.parentId, isNull);
    });

    test('copyWithが正しく動作すること', () {
      final node = NodeModel(
        id: 1,
        name: 'オリジナル',
        parentId: null,
      );

      final copied = node.copyWith(name: '変更後');

      expect(copied.id, 1);
      expect(copied.name, '変更後');
      expect(copied.parentId, isNull);
    });

    test('copyWithで全プロパティを変更できること', () {
      final node = NodeModel(
        id: 1,
        name: 'オリジナル',
        parentId: null,
      );

      final copied = node.copyWith(
        id: 2,
        name: '変更後',
        parentId: 1,
      );

      expect(copied.id, 2);
      expect(copied.name, '変更後');
      expect(copied.parentId, 1);
    });

    test('等価性が正しく判定されること', () {
      final node1 = NodeModel(id: 1, name: 'テスト', parentId: null);
      final node2 = NodeModel(id: 1, name: 'テスト', parentId: null);
      final node3 = NodeModel(id: 2, name: 'テスト', parentId: null);

      expect(node1 == node2, isTrue);
      expect(node1 == node3, isFalse);
    });

    test('hashCodeが正しく生成されること', () {
      final node1 = NodeModel(id: 1, name: 'テスト', parentId: null);
      final node2 = NodeModel(id: 1, name: 'テスト', parentId: null);

      expect(node1.hashCode, node2.hashCode);
    });

    test('toStringが正しく動作すること', () {
      final node = NodeModel(id: 1, name: 'テスト', parentId: 2);

      expect(node.toString(), 'NodeModel(id: 1, name: テスト, parentId: 2)');
    });
  });
}
