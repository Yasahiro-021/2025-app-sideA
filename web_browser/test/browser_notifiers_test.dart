import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/node/node_with_path.dart';
import 'package:web_browser/browser/notifiers/root_node_notifier.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/notifiers/url_titles_notifier.dart';
import 'package:web_browser/browser/notifiers/bottom_nodes_notifier.dart';
import 'package:web_browser/browser/notifiers/webview_controller_notifier.dart';
import 'package:web_browser/browser/notifiers/multi_add_enabled_notifier.dart';

void main() {
  group('RootNodeNotifier', () {
    test('buildで初期ルートノードを返す', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final rootNode = container.read(rootNodeNotifierProvider);

      expect(rootNode.name, "      ");
      expect(rootNode.path, "0");
      expect(rootNode.url, "");
    });

    test('setRootNodeでルートノードを設定できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final newRoot = NodeWithPath(
        name: 'new root',
        url: 'https://example.com',
        isRoot: true,
      );

      container.read(rootNodeNotifierProvider.notifier).setRootNode(newRoot);
      final rootNode = container.read(rootNodeNotifierProvider);

      expect(rootNode.name, 'new root');
      expect(rootNode.url, 'https://example.com');
    });
  });

  group('CurrentNodeNotifier', () {
    test('buildでルートノードと同じ初期ノードを返す', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final currentNode = container.read(currentNodeNotifierProvider);
      final rootNode = container.read(rootNodeNotifierProvider);

      expect(currentNode.path, rootNode.path);
    });

    test('changeNodeで現在ノードを変更できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final root = NodeWithPath(
        name: 'root',
        url: 'https://example.com',
        isRoot: true,
      );
      final newNode = NodeWithPath(
        name: 'new node',
        url: 'https://example.com/new',
        parent: root,
      );

      container.read(currentNodeNotifierProvider.notifier).changeNode(newNode);
      final currentNode = container.read(currentNodeNotifierProvider);

      expect(currentNode.name, 'new node');
      expect(currentNode.path, '1-1');
    });
  });

  group('UrlTitlesNotifier', () {
    test('buildで初期タイトルURLマップを返す', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final urlTitles = container.read(urlTitlesNotifierProvider);

      expect(urlTitles['Google'], 'https://www.google.com/');
    });

    test('addTitleUrlでタイトルとURLを追加できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(urlTitlesNotifierProvider.notifier)
          .addTitleUrl('Example', 'https://example.com');
      final urlTitles = container.read(urlTitlesNotifierProvider);

      expect(urlTitles['Example'], 'https://example.com');
    });

    test('updateTitleUrlでURLを更新できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container
          .read(urlTitlesNotifierProvider.notifier)
          .addTitleUrl('Example', 'https://example.com');
      container
          .read(urlTitlesNotifierProvider.notifier)
          .updateTitleUrl('Example', 'https://example.com/updated');
      final urlTitles = container.read(urlTitlesNotifierProvider);

      expect(urlTitles['Example'], 'https://example.com/updated');
    });
  });

  group('BottomNodesNotifier', () {
    test('buildで空リストを返す', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final bottomNodes = container.read(bottomNodesNotifierProvider);

      expect(bottomNodes, isEmpty);
    });

    test('setNodesでノードリストを設定できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final root = NodeWithPath(
        name: 'root',
        url: 'https://example.com',
        isRoot: true,
      );
      final node1 = NodeWithPath(
        name: 'test1',
        url: 'https://example.com/1',
        parent: root,
      );
      final node2 = NodeWithPath(
        name: 'test2',
        url: 'https://example.com/2',
        parent: root,
      );

      container.read(bottomNodesNotifierProvider.notifier).setNodes([node1, node2]);
      final bottomNodes = container.read(bottomNodesNotifierProvider);

      expect(bottomNodes.length, 2);
      expect(bottomNodes.first.name, 'test1');
      expect(bottomNodes.last.name, 'test2');
    });

    test('addNodeでノードを追加できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final root = NodeWithPath(
        name: 'root',
        url: 'https://example.com',
        isRoot: true,
      );
      final node = NodeWithPath(
        name: 'test',
        url: 'https://example.com',
        parent: root,
      );

      container.read(bottomNodesNotifierProvider.notifier).addNode(node);
      final bottomNodes = container.read(bottomNodesNotifierProvider);

      expect(bottomNodes.length, 1);
      expect(bottomNodes.first.name, 'test');
    });

    test('addNodeで重複したノードは追加されない', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final root = NodeWithPath(
        name: 'root',
        url: 'https://example.com',
        isRoot: true,
      );
      final node = NodeWithPath(
        name: 'test',
        url: 'https://example.com',
        parent: root,
      );

      container.read(bottomNodesNotifierProvider.notifier).addNode(node);
      container.read(bottomNodesNotifierProvider.notifier).addNode(node);
      final bottomNodes = container.read(bottomNodesNotifierProvider);

      expect(bottomNodes.length, 1);
    });

    test('removeNodeでノードを削除できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final root = NodeWithPath(
        name: 'root',
        url: 'https://example.com',
        isRoot: true,
      );
      final node = NodeWithPath(
        name: 'test',
        url: 'https://example.com',
        parent: root,
      );

      container.read(bottomNodesNotifierProvider.notifier).addNode(node);
      container.read(bottomNodesNotifierProvider.notifier).removeNode(node);
      final bottomNodes = container.read(bottomNodesNotifierProvider);

      expect(bottomNodes, isEmpty);
    });
  });

  group('WebViewControllerNotifier', () {
    test('buildでnullを返す', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(webViewControllerNotifierProvider);

      expect(controller, isNull);
    });

    // Note: WebViewControllerの実際の設定テストは、
    // モックまたは統合テストで行う必要があります
  });

  group('MultiAddEnabledNotifier', () {
    test('buildでtrueを返す（初期状態は有効）', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final enabled = container.read(multiAddEnabledNotifierProvider);

      expect(enabled, true);
    });

    test('toggleで状態を切り替えられる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(multiAddEnabledNotifierProvider.notifier).toggle();
      expect(container.read(multiAddEnabledNotifierProvider), false);

      container.read(multiAddEnabledNotifierProvider.notifier).toggle();
      expect(container.read(multiAddEnabledNotifierProvider), true);
    });

    test('setEnabledで明示的に設定できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      container.read(multiAddEnabledNotifierProvider.notifier).setEnabled(false);
      expect(container.read(multiAddEnabledNotifierProvider), false);

      container.read(multiAddEnabledNotifierProvider.notifier).setEnabled(true);
      expect(container.read(multiAddEnabledNotifierProvider), true);
    });
  });
}
