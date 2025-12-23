import 'dart:collection';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test/test.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/group_manager.dart';
import 'package:web_browser/tree/model/group.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';
import 'package:web_browser/tree/view/tree_settings.dart';

import '../test_tools/mockChildrenAtPath.dart';

void main() {
  group('GroupManagerProvider', () {
    final List<(NodePath, int)> createChildCount = [
      (NodePath.root, 3), // ルートに3つの子ノード
      //rootのGroup
      (NodePath(path: [0]), 2), //[0]に2つの子ノード
      (NodePath(path: [1]), 3), //[1]に3つの子ノード
      (NodePath(path: [2]), 1), //[2]に1つの子ノード
      
      (NodePath(path: [0, 0]), 1), //[0,0]に1個の子ノード
      // ※rootのグループのtreeWidthは変わらない
    ];

    ProviderContainer testContainer = ProviderContainer();
    final double groupPadding = 2.0;

    setUp(() {
      final childrenAtPathOverrides = mockChildrenAtPath(createChildCount);
      final treeSettingsOverrides = [
        treeSettingsProvider.overrideWithValue(
          TreeSettings(groupPadding: groupPadding),
        ),
      ];

      testContainer = ProviderContainer.test(
        overrides: [...childrenAtPathOverrides, ...treeSettingsOverrides],
      );
    });

    test('グループの幅を計算できる', () {
      final Group rootChildren = testContainer.read(
        groupManagerProvider(NodePath.root),
      );
      expect(
        rootChildren.width,
        3 + groupPadding * 2,
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
        rootLength + groupPadding * 2,
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

      expect(rootGroup.treeWidth, 18, reason: "root Tree Width mismatch");
    });
    tearDown(() {
      testContainer.dispose();
    });
  });
}
