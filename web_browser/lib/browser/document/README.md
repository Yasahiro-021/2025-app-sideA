# ブラウザ機能設計ドキュメント

最終更新: 2025-11-24

このディレクトリには、Webブラウザ機能の設計ドキュメントが格納されています。

## ドキュメント一覧

### 1. browser_view_architecture.md

ブラウザ機能のアーキテクチャ設計書です。

**内容:**

- 設計思想（イミュータブル性、状態管理の粒度）
- Mermaid形式のアーキテクチャ図
- 主要コンポーネントの責務
  - Model層: `BrowserNode`, `NodePath`, `NodeChildren`
  - ViewModel層: `CurrentPathNotifier`, `BrowserNodeFromPathNotifier`, `BrowserNodeChildrenNotifier`, `CurrentNodeProvider`
  - Domain層: `CreateNodeUsecase`
- データフローの例
- 実装のポイント

## 設計原則

これらのドキュメントで記述されている設計は、以下のFlutter公式アーキテクチャ（<https://docs.flutter.dev/app-architecture>）の原則に準拠しています：

1. **関心の分離**: UI、ロジック、データの各層を明確に分離
2. **状態項目ごとの管理**: 各状態項目を個別のNotifierで管理し、無駄な再初期化を削減
3. **イミュータビリティ**: ModelはFreezedでイミュータブルに設計
4. **単一責任の原則**: 各Notifierは明確な責任を持つ
5. **テスト容易性**: 各コンポーネントが独立しており、ユニットテストが容易

## アーキテクチャの特徴

### ノードとパスの分離

- **BrowserNode**: ノードの内容（タイトル、URL）のみを保持
- **NodePath**: ツリー内の位置情報を整数リストで表現
- **NodeChildren**: 子ノードのパスリストを管理

この分離により、子ノードの追加・削除時にノード本体を再構築する必要がなく、効率的な部分更新が可能です。

### Family Notifierの活用

`BrowserNodeFromPathNotifier`と`BrowserNodeChildrenNotifier`はFamily Notifierとして実装され、
パスごとに独立した状態管理を実現しています。これにより：

- 特定ノードの更新が他のノードに影響しない
- メモリ効率の良い状態管理
- 自動的なライフサイクル管理

### リアクティブな状態連動

`CurrentNodeProvider`は`CurrentPathNotifier`と`BrowserNodeFromPathNotifier`を組み合わせることで、
パスの変更に応じて自動的に適切なノード情報を提供します。

## 対象読者

- ブラウザ機能の実装を理解したい開発者
- ブラウザ機能の拡張や改修を行う開発者
- アーキテクチャレビューを行うレビュアー
- 新規メンバーのオンボーディング

## 関連ファイル

### 実装ファイル

#### Model層

- `web_browser/lib/browser/model/browser_node.dart` - BrowserNode
- `web_browser/lib/browser/model/node_path.dart` - NodePath
- `web_browser/lib/browser/model/node_children.dart` - NodeChildren

#### ViewModel層

- `web_browser/lib/browser/view_model/notifiers/current_path_notifier.dart` - CurrentPathNotifier
- `web_browser/lib/browser/view_model/notifiers/browser_node_from_path_notifier.dart` - BrowserNodeFromPathNotifier
- `web_browser/lib/browser/view_model/notifiers/browser_node_children_notifier.dart` - BrowserNodeChildrenNotifier
- `web_browser/lib/browser/view_model/notifiers/current_node_provider.dart` - CurrentNodeProvider
- `web_browser/lib/browser/view_model/notifiers/root_path_provider.dart` - RootPathProvider
- `web_browser/lib/browser/view_model/notifiers/webview_controller_notifier.dart` - WebViewControllerNotifier
- `web_browser/lib/browser/view_model/notifiers/multi_add_enabled_notifier.dart` - MultiAddEnabledNotifier
- `web_browser/lib/browser/view_model/notifiers/search_word_notifier.dart` - SearchWordNotifier
- `web_browser/lib/browser/view_model/notifiers/search_bar_expanded_notifier.dart` - SearchBarExpandedNotifier
- `web_browser/lib/browser/view_model/notifiers/url_titles_notifier.dart` - UrlTitlesNotifier

#### Domain層

- `web_browser/lib/browser/domain/usecase/create_node_usecase.dart` - CreateNodeUsecase
- `web_browser/lib/browser/domain/usecase/node_path_to_node_function.dart` - NodePathToNodeFunction

#### View層

- `web_browser/lib/browser/view/browser_view.dart` - BrowserView（メイン画面）
- `web_browser/lib/browser/view/components/` - 各種UIコンポーネント

#### Controller

- `web_browser/lib/browser/browser_viewmodel.dart` - BrowserViewModel


---

**バージョン**: 3.0

