import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/browser_controller.dart';
import 'package:web_browser/browser/model/node_with_path.dart';
import 'package:web_browser/browser/notifiers/root_node_notifier.dart';
import 'package:web_browser/browser/notifiers/current_node_notifier.dart';
import 'package:web_browser/browser/notifiers/url_titles_notifier.dart';

void main() {
  group('BrowserController', () {
    test('初期化時に各Notifierにアクセスできる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);

      expect(controller.rootNode, isNotNull);
      expect(controller.currentNode, isNotNull);
      expect(controller.urlTitles, isNotNull);
      expect(controller.bottomNodes, isNotNull);
    });

    test('initialUrlが正しく設定されている', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);

      expect(controller.initialUrl, 'https://www.google.com/');
    });

    test('settingsが正しく設定されている', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);

      expect(controller.settings.javaScriptEnabled, true);
    });

    test('setRootNodeでルートノードと現在ノードを設定できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);
      final newRoot = NodeWithPath.root(
        name: 'Test Root',
        url: 'https://example.com',
      );

      controller.setRootNode(newRoot);

      final rootNode = container.read(rootNodeNotifierProvider);
      final currentNode = container.read(currentNodeNotifierProvider);
      final urlTitles = container.read(urlTitlesNotifierProvider);

      expect(rootNode.name, 'Test Root');
      expect(currentNode.name, 'Test Root');
      expect(urlTitles['Test Root'], 'https://example.com');
    });

    test('isGoogleUrlでGoogleのURLを正しく判定できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);

      expect(controller.isGoogleUrl('https://www.google.com/'), true);
      expect(controller.isGoogleUrl('https://www.google.com/search?q=test'), true);
      expect(controller.isGoogleUrl('https://example.com'), false);
    });

    test('multiAddEnabledの初期値がtrueである', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);

      expect(controller.multiAddEnabled, true);
    });

    test('複数のノードを追加した場合にパスが連番になる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);
      final root = NodeWithPath.root(
        name: 'Root',
        url: 'https://example.com',
      );

      controller.setRootNode(root);

      // 1つ目のノード
      final node1 = NodeWithPath(
        name: 'Node 1',
        url: 'https://example.com/1',
        parent: root,
      );

      // 2つ目のノード
      final node2 = NodeWithPath(
        name: 'Node 2',
        url: 'https://example.com/2',
        parent: root,
      );

      expect(node1.path, '1-1');
      expect(node2.path, '1-2');
      expect(root.children.length, 2);
    });

    test('changeNodeで現在ノードを変更できる', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final controller = container.read(browserControllerProvider);
      final root = NodeWithPath.root(
        name: 'Root',
        url: 'https://example.com',
      );
      final newNode = NodeWithPath(
        name: 'New Node',
        url: 'https://example.com/new',
        parent: root,
      );

      controller.changeNode(newNode);

      final currentNode = container.read(currentNodeNotifierProvider);
      expect(currentNode.name, 'New Node');
      expect(currentNode.path, '1-1');
    });
  });
}
