import 'dart:collection';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/test.dart';
import 'package:web_browser/core/node/node_children.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group.dart';

void main() {
  group('GroupManagerProvider', () {
    final List<(NodePath, int)> createChildCount = [
      (NodePath.root, 3), // ルートに3つの子ノード
      //rootのGroup
      (NodePath(path: [0]), 2), //[0]に2つの子ノード
      (NodePath(path: [1]), 3), //[1]に3つの子ノード
      (NodePath(path: [2]), 1), //[2]に1つの子ノード
      // 3 * 2 + 2 + 3 + 1 = 12　がtreeWidth

      (NodePath(path: [0, 0]), 1), //[0,0]に1個の子ノード
      // ※rootのグループのtreeWidthは変わらない
    ];

    ProviderContainer testContainer = ProviderContainer();

    setUp(() {
      List<NodePath> shouldEmptyMockPaths =
          []; // モックする過程で作成したパスを格納するリスト。参照されるためモックする必要がある。
      List<(NodePath, List<NodePath>)> childrenList = createChildCount.map((e) {
        NodePath parentPath = e.$1;
        int childCount = e.$2;
        List<NodePath> childPaths = List.generate(
          childCount,
          (index) => parentPath.createChildPath(index),
        );
        shouldEmptyMockPaths.addAll(childPaths);
        return (parentPath, childPaths);
      }).toList();

      //モックに呼び出されるグループを作成しておく。
      shouldEmptyMockPaths = shouldEmptyMockPaths
          .where(
            //モックされていないパスのみ抽出
            (path) => createChildCount.map((e) => e.$1).contains(path) == false,
          )
          .toList();

      List<Override> emptyOverrides = shouldEmptyMockPaths.map((path) {
        return childrenAtPathMangerProvider(
          path,
        ).overrideWithValue(NodeChildren(children: []));
      }).toList();

      testContainer = ProviderContainer(
        overrides: [
          ...childrenList.map((e) {
            NodePath path = e.$1;
            return childrenAtPathMangerProvider(
              path,
            ).overrideWithValue(NodeChildren(children: e.$2));
          }),
          ...emptyOverrides,
        ],
      );
    });

    test('グループの幅を計算できる', () {
      final Group rootChildren = testContainer.read(
        groupManagerProvider(NodePath.root),
      );
      expect(
        rootChildren.width,
        3 + GroupManager.groupPadding * 2,
      ); // 3つの子ノード + パディング
    });
    test('自分をルートとしたサブツリーの幅を計算できる', () {
      final Group rootGroup = testContainer.read(
        groupManagerProvider(NodePath.root),
      );
      final rootLength = rootGroup.elements.length;
      log("Root Group Elements Count: $rootLength");
      expect(
        rootGroup.width,
        rootLength + GroupManager.groupPadding * 2,
        reason: "root Width mismatch",
      );

      Queue childGroups = Queue<Group>();
      childGroups.addAll(rootGroup.childrenGroup);
      while (childGroups.isNotEmpty) {
        final currentGroup = childGroups.removeFirst();
        final width = currentGroup.width;
        log("Checking Group at path: ${currentGroup.path}, Width: $width");
        childGroups.addAll(currentGroup.childrenGroup);
      }

      expect(rootGroup.treeWidth, 12);
    });
    tearDown(() {
      testContainer.dispose();
    });
  });
}