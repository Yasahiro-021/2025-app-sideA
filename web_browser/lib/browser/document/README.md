# ブラウザ機能設計ドキュメント

このディレクトリには、Webブラウザ機能のロジック設計に関するドキュメントが格納されています。

## ドキュメント一覧

### 1. browser_logic_design.md

ブラウザ機能の詳細設計書です。

**内容:**

- アーキテクチャ概要
- クラス一覧（11クラス）とそれぞれの詳細
  - BrowserController
  - RootNodeNotifier
  - CurrentNodeNotifier
  - UrlTitlesNotifier
  - BottomNodesNotifier
  - WebViewControllerNotifier
  - MultiAddEnabledNotifier
  - SearchWordNotifier
  - SearchBarExpandedNotifier
  - Node
  - NodeWithPath
- Riverpod Providerの定義
- Mermaid形式のUMLクラス図
- 主要な処理フロー
- NodeWithPathのパスID生成例
- 設計上の考慮事項
- Flutterアーキテクチャガイドラインへの準拠
- 今後の改善点

### 2. browser_architecture_diagrams.md

ブラウザ機能のアーキテクチャを視覚的に表現したドキュメントです。

**内容:**

- Mermaid形式のクラス図
- アーキテクチャの特徴
  - 状態の分離管理
  - BrowserControllerの役割
  - NodeWithPathの設計
  - Providerの構成
  - データフロー

## 設計原則

これらのドキュメントで記述されている設計は、以下のFlutter公式アーキテクチャ（<https://docs.flutter.dev/app-architecture）の原則に準拠しています：>

1. **関心の分離**: UI、ロジック、データの各層を明確に分離
2. **状態項目ごとの管理**: 各状態項目を個別のNotifierで管理し、無駄な再初期化を削減
3. **イミュータビリティ**: NodeWithPathはイミュータブルに設計
4. **単一責任の原則**: 各Notifierは明確な責任を持つ
5. **テスト容易性**: 各コンポーネントが独立しており、ユニットテストが容易

## 主な変更点（v2.0）

- **状態の分離**: BrowserStateを廃止し、各状態項目を個別のNotifierで管理
- **新しいNotifierの追加**: MultiAddEnabledNotifier、SearchWordNotifier、SearchBarExpandedNotifierを追加
- **NodeWithPathの実装変更**: イミュータブルな設計からNodeクラスを継承したミュータブルな実装へ変更
- **自動パス計算**: NodeWithPathのコンストラクタで親ノードからパスを自動計算
- **リアクティブな状態連動**: BrowserControllerでref.listenを使用してcurrentNodeの変更を監視し、bottomNodesを自動更新
- **メソッド名の統一**: UrlTitlesNotifierのメソッド名をaddTitleUrl、updateTitleUrlに変更
- **Mermaid図への移行**: ASCII artからMermaid形式のUML図に変更

## 対象読者

- ブラウザ機能の実装を理解したい開発者
- ブラウザ機能の拡張や改修を行う開発者
- アーキテクチャレビューを行うレビュアー
- 新規メンバーのオンボーディング

## 関連ファイル

実装ファイル：

- `web_browser/lib/browser/browser_controller.dart` - BrowserController
- `web_browser/lib/browser/notifiers/root_node_notifier.dart` - RootNodeNotifier
- `web_browser/lib/browser/notifiers/current_node_notifier.dart` - CurrentNodeNotifier
- `web_browser/lib/browser/notifiers/url_titles_notifier.dart` - UrlTitlesNotifier
- `web_browser/lib/browser/notifiers/bottom_nodes_notifier.dart` - BottomNodesNotifier
- `web_browser/lib/browser/notifiers/webview_controller_notifier.dart` - WebViewControllerNotifier
- `web_browser/lib/browser/notifiers/multi_add_enabled_notifier.dart` - MultiAddEnabledNotifier
- `web_browser/lib/browser/notifiers/search_word_notifier.dart` - SearchWordNotifier
- `web_browser/lib/browser/notifiers/search_bar_expanded_notifier.dart` - SearchBarExpandedNotifier
- `web_browser/lib/node/node.dart` - Node基底クラス
- `web_browser/lib/browser/model/node_with_path.dart` - NodeWithPath
- `web_browser/lib/browser/ui/browser_view_widget.dart` - UIレイヤー

---

**最終更新**: 2025年10月
**バージョン**: 2.1
