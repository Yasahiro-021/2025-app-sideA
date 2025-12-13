import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/db/models/node_model.dart';

void main() {
  group('NodeModel', () {
    test('正常にインスタンスが作成できること', () {
      final node = NodeModel(
        id: 1,
        treeId: 1,
        path: '/0',
        title: 'テストノード',
        url: 'https://example.com',
        date: '2025-12-11',
      );

      expect(node.id, 1);
      expect(node.treeId, 1);
      expect(node.path, '/0');
      expect(node.title, 'テストノード');
      expect(node.url, 'https://example.com');
      expect(node.date, '2025-12-11');
    });

    test('ルートノードが作成できること', () {
      final node = NodeModel(
        treeId: 1,
        path: '/',
        title: 'ルート',
        url: 'https://root.com',
      );

      expect(node.path, '/');
      expect(node.title, 'ルート');
      expect(node.date, isNull);
    });

    test('深い階層のノードが作成できること', () {
      final node = NodeModel(
        treeId: 1,
        path: '/0/1/2/3',
        title: '深いノード',
        url: 'https://deep.com',
      );

      expect(node.path, '/0/1/2/3');
    });

    test('toMapが正しく動作すること', () {
      final node = NodeModel(
        id: 1,
        treeId: 2,
        path: '/0/1',
        title: 'テストノード',
        url: 'https://example.com',
        date: '2025-12-11',
      );

      final map = node.toMap();

      expect(map['id'], 1);
      expect(map['tree_id'], 2);
      expect(map['path'], '/0/1');
      expect(map['title'], 'テストノード');
      expect(map['url'], 'https://example.com');
      expect(map['date'], '2025-12-11');
    });

    test('toMapでidがnullの場合はidが含まれないこと', () {
      final node = NodeModel(
        treeId: 1,
        path: '/',
        title: 'テストノード',
        url: 'https://example.com',
      );

      final map = node.toMap();

      expect(map.containsKey('id'), isFalse);
      expect(map['tree_id'], 1);
      expect(map['path'], '/');
    });

    test('fromMapが正しく動作すること', () {
      final map = {
        'id': 1,
        'tree_id': 2,
        'path': '/0/1',
        'title': 'テストノード',
        'url': 'https://example.com',
        'date': '2025-12-11',
      };

      final node = NodeModel.fromMap(map);

      expect(node.id, 1);
      expect(node.treeId, 2);
      expect(node.path, '/0/1');
      expect(node.title, 'テストノード');
      expect(node.url, 'https://example.com');
      expect(node.date, '2025-12-11');
    });

    test('fromMapでdateがnullの場合も正しく動作すること', () {
      final map = {
        'id': 1,
        'tree_id': 1,
        'path': '/',
        'title': 'ルートノード',
        'url': 'https://root.com',
        'date': null,
      };

      final node = NodeModel.fromMap(map);

      expect(node.id, 1);
      expect(node.path, '/');
      expect(node.date, isNull);
    });

    test('copyWithが正しく動作すること', () {
      final node = NodeModel(
        id: 1,
        treeId: 1,
        path: '/0',
        title: 'オリジナル',
        url: 'https://original.com',
      );

      final copied = node.copyWith(title: '変更後');

      expect(copied.id, 1);
      expect(copied.treeId, 1);
      expect(copied.path, '/0');
      expect(copied.title, '変更後');
      expect(copied.url, 'https://original.com');
    });

    test('copyWithで全プロパティを変更できること', () {
      final node = NodeModel(
        id: 1,
        treeId: 1,
        path: '/0',
        title: 'オリジナル',
        url: 'https://original.com',
      );

      final copied = node.copyWith(
        id: 2,
        treeId: 3,
        path: '/1',
        title: '変更後',
        url: 'https://changed.com',
        date: '2025-12-12',
      );

      expect(copied.id, 2);
      expect(copied.treeId, 3);
      expect(copied.path, '/1');
      expect(copied.title, '変更後');
      expect(copied.url, 'https://changed.com');
      expect(copied.date, '2025-12-12');
    });

    test('等価性が正しく判定されること', () {
      final node1 = NodeModel(id: 1, treeId: 1, path: '/', title: 'テスト', url: 'https://test.com');
      final node2 = NodeModel(id: 1, treeId: 1, path: '/', title: 'テスト', url: 'https://test.com');
      final node3 = NodeModel(id: 2, treeId: 1, path: '/', title: 'テスト', url: 'https://test.com');
      final node4 = NodeModel(id: 1, treeId: 2, path: '/', title: 'テスト', url: 'https://test.com');

      expect(node1 == node2, isTrue);
      expect(node1 == node3, isFalse);
      expect(node1 == node4, isFalse);
    });

    test('hashCodeが正しく生成されること', () {
      final node1 = NodeModel(id: 1, treeId: 1, path: '/', title: 'テスト', url: 'https://test.com');
      final node2 = NodeModel(id: 1, treeId: 1, path: '/', title: 'テスト', url: 'https://test.com');

      expect(node1.hashCode, node2.hashCode);
    });

    test('toStringが正しく動作すること', () {
      final node = NodeModel(
        id: 1,
        treeId: 2,
        path: '/0',
        title: 'テスト',
        url: 'https://test.com',
        date: '2025-12-11',
      );

      expect(
        node.toString(),
        'NodeModel(id: 1, treeId: 2, path: /0, title: テスト, url: https://test.com, date: 2025-12-11)',
      );
    });
  });
}
