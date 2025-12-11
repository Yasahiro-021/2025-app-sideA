import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
import 'package:web_browser/tree/view/components/tree_map/tree_map_view.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('ツリー画面のスクリーンショットを撮影', (WidgetTester tester) async {
    // ProviderContainerを作成
    final container = ProviderContainer();

    // テストデータを設定
    // ルートの子ノードを追加
    final rootChildren = container.read(childrenAtPathMangerProvider(NodePath.root).notifier);
    final child0 = rootChildren.provideNewChildPath(); // /0
    final child1 = rootChildren.provideNewChildPath(); // /1
    final child2 = rootChildren.provideNewChildPath(); // /2

    // /0 の子ノードを追加
    final child0Children = container.read(childrenAtPathMangerProvider(child0).notifier);
    child0Children.provideNewChildPath(); // /0/0
    child0Children.provideNewChildPath(); // /0/1

    // /1 の子ノードを追加
    final child1Children = container.read(childrenAtPathMangerProvider(child1).notifier);
    child1Children.provideNewChildPath(); // /1/0

    // /2 は子なし（空グループにならないことを確認）

    // スクリーンショット用のキーを作成
    final screenshotKey = GlobalKey();

    // ウィジェットをビルド
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: Scaffold(
            appBar: AppBar(title: const Text('ツリー画面テスト')),
            body: RepaintBoundary(
              key: screenshotKey,
              child: const TreeMapView(),
            ),
          ),
        ),
      ),
    );

    // 画面が安定するまで待機
    await tester.pumpAndSettle();

    // スクリーンショットを撮影して保存
    await _takeScreenshot(screenshotKey, 'tree_view_screenshot');

    // クリーンアップ
    container.dispose();
  });
}

/// RepaintBoundaryからスクリーンショットを撮影してファイルに保存
Future<void> _takeScreenshot(GlobalKey key, String filename) async {
  try {
    final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      print('エラー: RenderRepaintBoundaryが見つかりません');
      return;
    }

    final image = await boundary.toImage(pixelRatio: 2.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    
    if (byteData == null) {
      print('エラー: 画像データの取得に失敗しました');
      return;
    }

    final bytes = byteData.buffer.asUint8List();
    
    // スクリーンショットディレクトリを作成
    final directory = Directory('screenshots');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    // ファイルに保存
    final file = File('screenshots/$filename.png');
    await file.writeAsBytes(bytes);
    print('スクリーンショットを保存しました: ${file.path}');
  } catch (e) {
    print('スクリーンショットの撮影に失敗しました: $e');
  }
}
