# ブラウザ機能実装

このディレクトリには、Webブラウザ機能の実装が含まれています。

## アーキテクチャ

本実装は`document/`ディレクトリに記載された設計に基づいています。
詳細な設計ドキュメントは以下を参照してください：

- [browser_logic_design.md](document/browser_logic_design.md) - 詳細設計書
- [browser_architecture_diagrams.md](document/browser_architecture_diagrams.md) - アーキテクチャ図
- [README.md](document/README.md) - ドキュメント概要

## 主要クラス

### データモデル
- **NodeWithPath** (`../node/node_with_path.dart`)
  - パスIDを持つイミュータブルなノードクラス
  - ツリー構造内での位置を一意に識別

### 状態管理 (Notifiers)
- **RootNodeNotifier** (`notifiers/root_node_notifier.dart`)
  - ルートノードの状態管理
- **CurrentNodeNotifier** (`notifiers/current_node_notifier.dart`)
  - 現在のノードの状態管理
- **UrlTitlesNotifier** (`notifiers/url_titles_notifier.dart`)
  - URLとタイトルのマッピング管理
- **BottomNodesNotifier** (`notifiers/bottom_nodes_notifier.dart`)
  - 下部バー用ノードリストの管理
- **WebViewControllerNotifier** (`notifiers/webview_controller_notifier.dart`)
  - WebViewコントローラーの管理
- **MultiAddEnabledNotifier** (`notifiers/multi_add_enabled_notifier.dart`)
  - 複数ノード追加の有効/無効を管理

### コントローラー
- **BrowserController** (`browser_controller.dart`)
  - 各Notifierを統合し、ビジネスロジックを提供
  - WebViewイベントの処理とナビゲーション制御

### UIレイヤー
- **BrowserViewWidget** (`browser_view.dart`)
  - ブラウザ画面のメインWidget
  - UIの描画を担当

## 設計原則

1. **関心の分離**: UI、ロジック、データの各層を明確に分離
2. **状態項目ごとの管理**: 各状態項目を個別のNotifierで管理し、無駄な再初期化を削減
3. **自動関係管理**: Nodeクラスが親子関係を自動管理し、整合性を保証
4. **単一責任の原則**: 各Notifierは明確な責任を持つ
5. **テスト容易性**: 各コンポーネントが独立しており、ユニットテストが容易

## 旧アーキテクチャからの移行

以下のファイルは旧アーキテクチャで、非推奨です：

- `browser_controller_notifier.dart` (BrowserState, BrowserControllerNotifier)
- `browser_current_node_notifier.dart` (BrowserCurrentNodeNotifier)
- `browser_bottom_bar.dart` (BrowserBottomBar)

新しい実装では：
- BrowserState → 個別のNotifierに分離
- BrowserControllerNotifier → BrowserController
- BrowserBottomBar → BrowserBottomBarNew (browser_view.dart内)

## テスト

テストファイル：
- `test/node_with_path_test.dart` - NodeWithPathのテスト
- `test/browser_notifiers_test.dart` - 各Notifierのテスト
- `test/browser_controller_test.dart` - BrowserControllerのテスト

## 使用例

```dart
// Provider経由でBrowserControllerを取得
final controller = ref.watch(browserControllerProvider);

// 各状態にアクセス
final currentNode = ref.watch(currentNodeNotifierProvider);
final rootNode = ref.watch(rootNodeNotifierProvider);
final bottomNodes = ref.watch(bottomNodesNotifierProvider);
final multiAddEnabled = ref.watch(multiAddEnabledNotifierProvider);

// コントローラーのメソッドを呼び出し
controller.setRootNode(newRootNode);
controller.openTreeView(context);
controller.changeNode(newNode);
controller.toggleMultiAddEnabled();

// 親子関係は自動管理される
final parent = NodeWithPath(name: 'parent', path: '0', url: 'https://example.com');
final child = NodeWithPath(name: 'child', path: '1-1', url: 'https://example.com/child', parent: parent);
// childは自動的にparentのchildrenに追加される
```

## 参考資料

- [Flutter公式アーキテクチャ](https://docs.flutter.dev/app-architecture)
- [Riverpod公式ドキュメント](https://riverpod.dev/)
