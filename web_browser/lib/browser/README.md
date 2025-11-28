# ブラウザ機能実装

最終更新: 2025-11-24

このディレクトリには、Webブラウザ機能の実装が含まれています。

以下では、主要なクラスとその役割について説明します。

## アーキテクチャ

本実装は`document/`ディレクトリに記載された設計に基づいています。
詳細な設計ドキュメントは以下を参照してください：

- [browser_view_architecture.md](document/browser_view_architecture.md) - アーキテクチャ設計書
- [README.md](document/README.md) - ドキュメント概要

## 主要クラス

### データモデル (Model層)

- **BrowserNode** (`model/browser_node.dart`)
  - ノード単体の情報を保持（タイトル、URL）
  - 他ノードとの関係は持たない。
  - Freezedでイミュータブルに実装

- **NodePath** (`model/node_path.dart`)
  - ツリー構造内での位置を一意に識別するパス、ID。
  - 整数リストでパスを表現
  - 深さや親のパスを算出することも可能

- **NodeChildren** (`model/node_children.dart`)
  - 特定ノードの子ノードパスのリストを保持
  - イミュータブルなコレクション

### 状態管理 (ViewModel層)

#### コアNotifier

- **CurrentPathNotifier** (`view_model/notifiers/current_path_notifier.dart`)
  - 現在表示中のノードのパスを管理する。
  - 変更されると画面も変わる、更新の起点。

- **BrowserNodeFromPathNotifier** (`view_model/notifiers/browser_node_from_path_notifier.dart`)
  - Family Notifier: 各パスに対応するBrowserNodeの情報を保持
  - 更新されると、そのパスを参照しているコンポーネントが再レンダリングされる。

- **BrowserNodeChildrenNotifier** (`view_model/notifiers/browser_node_children_notifier.dart`)
  - Family Notifier: 各パスの子パスをリストで管理
  - 新しい子パスの生成と追加を担当
  - 更新されると、そのパスの子リストを参照しているコンポーネント（BottomBarなど）が再レンダリングされる。

#### プロバイダー

- **CurrentNodeProvider** (`view_model/notifiers/current_node_provider.dart`)
  - 現在のノードの情報を提供
  - CurrentPathとBrowserNodeFromPathを組み合わせて算出

- **RootPathProvider** (`view_model/notifiers/root_path_provider.dart`)
  - ルートパスを提供
  - ルートのパスは固定（空リスト）のため、変更されることはない

#### その他の状態管理

- **WebViewControllerNotifier** (`view_model/notifiers/webview_controller_notifier.dart`)
  - WebViewコントローラーの管理

- **MultiAddEnabledNotifier** (`view_model/notifiers/multi_add_enabled_notifier.dart`)
  - 複数ノード追加の有効/無効を管理

- **SearchWordNotifier** (`view_model/notifiers/search_word_notifier.dart`)
  - 検索ワードを管理

- **SearchBarExpandedNotifier** (`view_model/notifiers/search_bar_expanded_notifier.dart`)
  - 検索バーの展開状態を管理

- **UrlTitlesNotifier** (`view_model/notifiers/url_titles_notifier.dart`)
  - URLとタイトルのマッピング管理

### ドメイン層 (UseCase)

- **CreateNodeUsecase** (`domain/usecase/create_node_usecase.dart`)
  - 新しいノードを作成し、パスを生成
  - ノードの登録処理をカプセル化

- **NodePathToNodeFunction** (`domain/usecase/node_path_to_node_function.dart`)
  - パスからノードへの変換機能

### コントローラー

- **BrowserViewModel** (`browser_viewmodel.dart`)
  - WebViewの設定とイベント処理
  - ページ読み込み完了時のコールバック
  - リンククリック時のナビゲーション制御

### View層

- **BrowserView** (`view/browser_view.dart`)
  - ブラウザ画面のエントリーポイント
  - AppBar、WebView、BottomBarを統合

#### コンポーネント構成

```text
view/
├── browser_view.dart (メイン画面)
└── components/
    ├── app_bar/ (上部バー)
    │   ├── browser_app_bar_view.dart
    │   ├── current_node_text/ (現在のノード名表示)
    │   ├── parent_node/ (親ノードボタン)
    │   └── tree_button/ (ツリー表示ボタン)
    ├── body/ (メインコンテンツ)
    │   ├── browser_web_view/ (WebView表示)
    │   └── floating_search_bar/ (検索バー)
    └── bottom_bar/ (下部バー)
        ├── browser_bottom_bar_view.dart
        ├── child_node/ (子ノード一覧)
        └── stay_switch/ (滞在スイッチ)
```

## データフローの例

### 子ノード作成時

#### `CreateNodeUsecase`を使用

1. createメソッドに親となるパスと、任意で子のBrowserNodeが渡される。
2. `BrowserNodeChildrenNotifier`に新しい子パスの追加を依頼
3. `BrowserNodeChildrenNotifier`が追加された新しい子パスを返す
4. 新しいパスとノード情報を`BrowserNodeFromPathNotifier`に登録
5. 新しいパスを呼び出し元に返す。

### ノード移動時

1. `CurrentPathNotifier.changePath()`が呼ばれる
2. 監視していた`CurrentNodeProvider`等が更新後のPathでBrowserNodeFromPathNotifierを参照。
3. 取得したBrowserNodeで再レンダリング

## 使用例

```dart
// 現在のノード情報を取得
final currentNode = ref.watch(currentNodeProviderProvider);
final currentPath = ref.watch(currentPathProvider);

// 新しいノードを作成
final createUsecase = ref.read(createNodeUsecaseProvider);
final newPath = createUsecase.create(
  parentPath: currentPath,
  node: BrowserNode(title: 'New Page', url: 'https://example.com'),
);

// ノードへ移動
ref.read(currentPathProvider.notifier).changePath(newPath);

// 子ノードのリストを取得
final children = ref.watch(browserNodeChildrenProvider(currentPath));

// 特定パスのノード情報を取得
final node = ref.watch(browserNodeFromPathProvider(newPath));
```
