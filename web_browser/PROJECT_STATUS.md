# Web Browser プロジェクト状況

最終更新: 2025年10月20日

## プロジェクト概要

このプロジェクトは、Flutterで実装されたWebブラウザアプリケーションです。
閲覧履歴をツリー構造で管理し、視覚的に表示する機能を持っています。

---

## 実装完了機能

### ✅ コア機能

#### 1. ブラウザ機能
- **WebView統合**: InAppWebViewを使用したWebページ表示
- **履歴ツリー管理**: 閲覧履歴をツリー構造で記録
- **ノード遷移**: 親ノード・子ノード・ルートノードへの移動
- **検索機能**: Google検索の実行と新規ルートノード作成
- **STAY機能**: リンククリック時の自動ノード追加のON/OFF切り替え

#### 2. UI実装
- **ホーム画面**: ブラウザ・ツリービューへの遷移ボタン
- **ブラウザ画面**: 
  - AppBar（親ノード・現在ノード表示、ルートボタン、検索ボタン）
  - WebViewコンテンツエリア
  - フローティング検索バー
  - 下部バー（STAYスイッチ、子ノードリスト）
- **ツリービュー画面**: InteractiveViewerでツリー構造を表示

#### 3. 状態管理（Riverpod）
以下のNotifierで状態を管理:
- `RootNodeNotifier`: ルートノード
- `CurrentNodeNotifier`: 現在のノード
- `UrlTitlesNotifier`: タイトル→URLマッピング
- `BottomNodesNotifier`: 下部バーの子ノードリスト
- `WebViewControllerNotifier`: WebViewコントローラー
- `MultiAddEnabledNotifier`: STAY機能のON/OFF
- `SearchWordNotifier`: 検索ワード
- `SearchBarExpandedNotifier`: 検索バーの展開状態

#### 4. データモデル
- **Node**: 基本ノードクラス（親子関係の自動管理）
- **NodeWithPath**: パスIDを持つノード（ツリー構造での位置識別）
- **NodeURL**: URL情報を持つノード

#### 5. ルーティング
- **go_router**: 宣言的ルーティング
- 3つのルート: Home (`/`), Browser (`/browser`), TreeView (`/tree`)

### ✅ テスト実装

#### 1. ユニットテスト
- `node_test.dart`: Nodeクラスのテスト（親子関係の自動管理含む）
- `node_with_path_test.dart`: NodeWithPathクラスのテスト
- `node_url_test.dart`: NodeURLクラスのテスト
- `browser_notifiers_test.dart`: 全Notifierの動作テスト
- `browser_controller_test.dart`: BrowserControllerのテスト
- `mocked_node_test.dart`: モックノード生成のテスト

#### 2. ウィジェットテスト（全11ファイル）
- **画面テスト**:
  - `home_page_test.dart`: ホーム画面
  - `browser_view_widget_test.dart`: ブラウザ画面
  - `treeview_test.dart`: ツリービュー画面
  - `router_test.dart`: ルーティング

- **コンポーネントテスト**:
  - `parent_node_test.dart`: 親ノード表示
  - `current_node_text_test.dart`: 現在ノード表示
  - `child_node_test.dart`: 子ノード表示
  - `node_widget_test.dart`: ツリーノードウィジェット
  - `tree_division_test.dart`: ツリー区画
  - `line_sector_test.dart`: ノード間の線描画
  - `children_tree_sector_test.dart`: 子ノード群管理

**テストカバレッジ**: 64+ テストケース

---

## アーキテクチャ

### レイヤー構成
1. **UIレイヤー**: Widgetコンポーネント
2. **コントローラーレイヤー**: BrowserController（ビジネスロジック）
3. **Notifierレイヤー**: Riverpodによる状態管理
4. **ドメインレイヤー**: データモデル（Node, NodeWithPath等）

### 設計原則
- **関心の分離**: UI、ロジック、データの明確な分離
- **単一責任**: 各Notifierは単一の状態を管理
- **リアクティブ**: 状態変更が自動的にUIに反映
- **テスタビリティ**: 独立したコンポーネントで高いテスト容易性

詳細は `lib/browser/README.md` を参照。

---

## ファイル構成

```
web_browser/
├── lib/
│   ├── main.dart                      # アプリエントリーポイント
│   ├── home_page.dart                 # ホーム画面
│   ├── browser/
│   │   ├── browser_controller.dart    # コントローラー
│   │   ├── README.md                  # ブラウザ機能ドキュメント
│   │   ├── model/
│   │   │   └── node_with_path.dart    # NodeWithPathモデル
│   │   ├── notifiers/                 # 状態管理Notifier群
│   │   └── ui/                        # UIコンポーネント
│   ├── node/
│   │   ├── node.dart                  # Nodeモデル
│   │   ├── node_url.dart              # NodeURLモデル
│   │   └── mocked_node.dart           # テスト用モックノード生成
│   ├── router/
│   │   └── router.dart                # ルーティング設定
│   └── tree_view/                     # ツリービュー画面とコンポーネント
│
├── test/
│   ├── node_test.dart                 # Nodeテスト
│   ├── node_with_path_test.dart       # NodeWithPathテスト
│   ├── node_url_test.dart             # NodeURLテスト
│   ├── browser_notifiers_test.dart    # Notifierテスト
│   ├── browser_controller_test.dart   # Controllerテスト
│   ├── mocked_node_test.dart          # モックノードテスト
│   ├── ui/                            # UIテスト
│   │   ├── home_page_test.dart
│   │   ├── browser/
│   │   └── tree_view/
│   ├── router/
│   │   └── router_test.dart
│   └── UI_TESTS_README.md             # テスト実行ガイド
│
├── README.md                          # プロジェクト概要（Flutter標準）
└── PROJECT_STATUS.md                  # このファイル（プロジェクト状況）
```

---

## テストの実行方法

### 全テスト実行
```bash
cd web_browser
flutter test
```

### 特定のテストファイル実行
```bash
flutter test test/ui/home_page_test.dart
```

### カバレッジレポート生成
```bash
flutter test --coverage
```

詳細は `test/UI_TESTS_README.md` を参照。

---

## 今後の課題・改善点

### 未実装機能
1. **履歴の永続化**: ローカルストレージへの保存
2. **メニュー機能**: メニューボタンの具体的な処理
3. **エラーハンドリング**: WebView読み込みエラー時の処理
4. **ブックマーク機能**: お気に入りノードの管理
5. **タブ機能**: 複数のブラウザタブ

### 技術的改善
1. **パフォーマンス最適化**: 大規模ツリーでの描画最適化
2. **アクセシビリティ**: スクリーンリーダー対応
3. **テストカバレッジ向上**: 統合テストの追加
4. **CI/CD**: 自動テスト実行パイプライン

---

## 開発環境

- **Flutter**: 3.x以上
- **Dart**: 3.x以上
- **主要パッケージ**:
  - `flutter_hooks`: ^0.20.5
  - `hooks_riverpod`: ^2.5.2
  - `flutter_inappwebview`: ^6.1.5
  - `go_router`: ^14.6.2

---

## ドキュメント

- `README.md`: プロジェクト概要（Flutter標準）
- `PROJECT_STATUS.md`: このファイル（プロジェクト全体の状況）
- `lib/browser/README.md`: ブラウザ機能の実装詳細
- `test/UI_TESTS_README.md`: テスト実行ガイド

設計ドキュメント（アーカイブ）:
- `lib/browser/document/`: 詳細設計書とアーキテクチャ図

---

## 履歴

- **2025-10**: UIテスト実装完了（64+ テストケース）
- **2025-10**: UI・Notifier統合完了
- **2025-10**: ブラウザロジック実装完了
- **2025-10**: プロジェクト開始
