# ブラウザ機能ロジック設計書

## 概要

このドキュメントは、Webブラウザ機能の内、UI以外のロジックの設計を記述します。
設計はFlutterの公式アーキテクチャ（https://docs.flutter.dev/app-architecture）に準拠しています。

## アーキテクチャの概要

本ブラウザ機能は、Flutter公式アーキテクチャの推奨に従い、以下の層構造で設計されています：

1. **UI Layer（UIレイヤー）**: ユーザーインターフェースの描画を担当（本設計書の対象外）
2. **Logic Layer（ロジックレイヤー）**: ビジネスロジックと状態管理を担当（本設計書の対象）
3. **Data Layer（データレイヤー）**: データモデルとドメインロジックを担当（本設計書の対象）

状態管理には**Riverpod**を使用し、**Notifier**パターンでリアクティブな状態管理を実現しています。
各状態項目は個別のNotifierで管理され、BrowserControllerクラスがフィールドとしてこれらを提供します。

## クラス一覧

### 1. BrowserController

**概要**: ブラウザの状態と操作を集約して提供するコントローラークラス

**役割**: 各状態管理Notifierを統合し、WebViewイベントの処理とナビゲーション制御を行う

**パブリックメンバ**:
- `RootNodeNotifier rootNodeNotifier` - ルートノード管理用Notifier
- `CurrentNodeNotifier currentNodeNotifier` - 現在ノード管理用Notifier
- `UrlTitlesNotifier urlTitlesNotifier` - URLタイトルマップ管理用Notifier
- `BottomNodesNotifier bottomNodesNotifier` - 下部バー用ノードリスト管理用Notifier
- `WebViewControllerNotifier webViewControllerNotifier` - WebViewコントローラー管理用Notifier
- `InAppWebViewSettings settings` - WebViewの設定（JavaScript有効化等）
- `String initialUrl` - アプリ起動時の初期URL（Google検索ページ）

**パブリックメソッド**:
- `void initialize()` - コントローラーの初期化
- `void setRootNode(NodeWithPath node)` - ルートノードの設定
- `void openTreeView(BuildContext context)` - 履歴ツリー画面への遷移
- `bool isGoogleUrl(String url)` - GoogleのURLか判定
- `void addBottomNode(NodeWithPath node)` - 下部バーにノードを追加
- `void onWebViewCreated(InAppWebViewController controller)` - WebView生成時のコールバック
- `void onLoadStop(InAppWebViewController controller, WebUri? loadedUrl)` - ページ読み込み完了時のコールバック
- `Future<NavigationActionPolicy> shouldOverrideUrlLoading(...)` - リンククリック時のコールバック
- `void changeNode(NodeWithPath node)` - 現在ノードの変更
- `void navigateToParentNode(String url)` - 親ノードへの遷移

### 2. RootNodeNotifier

**概要**: ルートノードを管理するNotifierクラス

**役割**: 履歴ツリーのルートノードの状態管理

**パブリックメソッド**:
- `NodeWithPath build()` - 初期ルートノードの構築
- `void setRootNode(NodeWithPath node)` - ルートノードの設定

### 3. CurrentNodeNotifier

**概要**: 現在のノードを管理するNotifierクラス

**役割**: 現在表示中のノードの状態管理

**パブリックメソッド**:
- `NodeWithPath build()` - 初期ノードの構築
- `void changeNode(NodeWithPath node)` - 現在ノードの変更

### 4. UrlTitlesNotifier

**概要**: URLとタイトルのマッピングを管理するNotifierクラス

**役割**: 各URLに対応するページタイトルの管理

**パブリックメソッド**:
- `Map<String, String> build()` - 初期マップの構築
- `void addUrlTitle(String url, String title)` - URLとタイトルを追加
- `void updateUrlTitle(String url, String title)` - タイトルを更新

### 5. BottomNodesNotifier

**概要**: 下部バーに表示するノードリストを管理するNotifierクラス

**役割**: 履歴として表示するノードリストの管理

**パブリックメソッド**:
- `List<NodeWithPath> build()` - 初期リストの構築
- `void addNode(NodeWithPath node)` - ノードを追加
- `void removeNode(NodeWithPath node)` - ノードを削除

### 6. WebViewControllerNotifier

**概要**: WebViewコントローラーを管理するNotifierクラス

**役割**: InAppWebViewControllerの保持と提供

**パブリックメソッド**:
- `InAppWebViewController? build()` - 初期状態（null）の構築
- `void setController(InAppWebViewController controller)` - コントローラーの設定

### 7. Node

**概要**: ツリー構造のノードを表すデータモデル

**役割**: 履歴ツリーの各要素を表現し、親子関係を管理

**パブリックメンバ**:
- `String name` - ノードの名前（getter）
- `List<Node> children` - 子ノードのリスト（getter）
- `Node? parent` - 親ノード（getter、nullはルートノードを示す）
- `int maxDepth` - ノードの最大深さ（lazy初期化、getter）

**パブリックメソッド**:
- `Node(String name, [Node? parent])` - コンストラクタ
- `void addChild(Node childNode)` - 子ノードの追加
- `String toString()` - 文字列表現（名前を返す）

### 8. NodeWithPath

**概要**: パスIDを持つイミュータブルなノードクラス

**役割**: ツリー構造内でのノードの位置を一意に識別するパスIDを持つノード

**パブリックメンバ**:
- `String name` - ノードの名前
- `String path` - ノードのパスID（例: "0", "1-1", "1-2", "2-1-3"）
- `String url` - ノードに紐づくURL
- `NodeWithPath? parent` - 親ノード
- `List<NodeWithPath> children` - 子ノードのリスト

**パブリックメソッド**:
- `NodeWithPath({required String name, required String path, required String url, NodeWithPath? parent, List<NodeWithPath> children = const []})` - コンストラクタ
- `NodeWithPath copyWith({...})` - イミュータブルなコピーメソッド
- `NodeWithPath addChild(NodeWithPath child)` - 子ノードを追加した新しいインスタンスを返す
- `String generateChildPath(int childIndex)` - 子ノードのパスIDを生成（例: "1-1" の子は "1-1-1", "1-1-2"...）
- `int get depth` - ノードの深さを取得（ルートは0）
- `String toString()` - 文字列表現（名前とパスを返す）

## Riverpod Providerの定義

### browserControllerProvider

**型**: `Provider<BrowserController>`

**役割**: BrowserControllerのインスタンスを提供し、各Notifierへのアクセスを統合する

### rootNodeNotifierProvider

**型**: `NotifierProvider<RootNodeNotifier, NodeWithPath>`

**役割**: ルートノードの状態を提供

### currentNodeNotifierProvider

**型**: `NotifierProvider<CurrentNodeNotifier, NodeWithPath>`

**役割**: 現在のノード状態を提供

### urlTitlesNotifierProvider

**型**: `NotifierProvider<UrlTitlesNotifier, Map<String, String>>`

**役割**: URLとタイトルのマッピングを提供

### bottomNodesNotifierProvider

**型**: `NotifierProvider<BottomNodesNotifier, List<NodeWithPath>>`

**役割**: 下部バー用のノードリストを提供

### webViewControllerNotifierProvider

**型**: `NotifierProvider<WebViewControllerNotifier, InAppWebViewController?>`

**役割**: WebViewコントローラーを提供

## UMLクラス図

```mermaid
classDiagram
    class BrowserController {
        +RootNodeNotifier rootNodeNotifier
        +CurrentNodeNotifier currentNodeNotifier
        +UrlTitlesNotifier urlTitlesNotifier
        +BottomNodesNotifier bottomNodesNotifier
        +WebViewControllerNotifier webViewControllerNotifier
        +InAppWebViewSettings settings
        +String initialUrl
        +initialize() void
        +setRootNode(NodeWithPath) void
        +openTreeView(BuildContext) void
        +isGoogleUrl(String) bool
        +addBottomNode(NodeWithPath) void
        +onWebViewCreated(InAppWebViewController) void
        +onLoadStop(InAppWebViewController, WebUri) void
        +shouldOverrideUrlLoading(...) Future~NavigationActionPolicy~
        +changeNode(NodeWithPath) void
        +navigateToParentNode(String) void
    }

    class RootNodeNotifier {
        <<Notifier~NodeWithPath~>>
        +build() NodeWithPath
        +setRootNode(NodeWithPath) void
    }

    class CurrentNodeNotifier {
        <<Notifier~NodeWithPath~>>
        +build() NodeWithPath
        +changeNode(NodeWithPath) void
    }

    class UrlTitlesNotifier {
        <<Notifier~Map~String,String~~>>
        +build() Map~String,String~
        +addUrlTitle(String, String) void
        +updateUrlTitle(String, String) void
    }

    class BottomNodesNotifier {
        <<Notifier~List~NodeWithPath~~>>
        +build() List~NodeWithPath~
        +addNode(NodeWithPath) void
        +removeNode(NodeWithPath) void
    }

    class WebViewControllerNotifier {
        <<Notifier~InAppWebViewController~>>
        +build() InAppWebViewController?
        +setController(InAppWebViewController) void
    }

    class Node {
        -String _name
        -List~Node~ _children
        -Node? _parent
        -int _maxDepth
        +String name
        +List~Node~ children
        +Node? parent
        +int maxDepth
        +addChild(Node) void
        +toString() String
    }

    class NodeWithPath {
        +String name
        +String path
        +String url
        +NodeWithPath? parent
        +List~NodeWithPath~ children
        +copyWith(...) NodeWithPath
        +addChild(NodeWithPath) NodeWithPath
        +generateChildPath(int) String
        +int depth
        +toString() String
    }

    BrowserController --> RootNodeNotifier : uses
    BrowserController --> CurrentNodeNotifier : uses
    BrowserController --> UrlTitlesNotifier : uses
    BrowserController --> BottomNodesNotifier : uses
    BrowserController --> WebViewControllerNotifier : uses
    RootNodeNotifier --> NodeWithPath : manages
    CurrentNodeNotifier --> NodeWithPath : manages
    BottomNodesNotifier --> NodeWithPath : manages
    NodeWithPath --|> Node : extends
```

## 主要な処理フロー

### 1. ページ読み込み完了時の処理

```
ユーザー操作（ページ遷移）
    ↓
onLoadStop() コールバック発火
    ↓
ページタイトル取得
    ↓
UrlTitlesNotifierでurlTitlesマップを更新
    ↓
新規NodeWithPathを作成（パスIDを生成）
    ↓
CurrentNodeNotifierで現在ノードを更新
    ↓
Google以外のURL → BottomNodesNotifierでbottomNodesに追加
```

### 2. リンククリック時の処理

```
ユーザー操作（リンククリック）
    ↓
shouldOverrideUrlLoading() コールバック発火
    ↓
クリックされたURLを取得
    ↓
新規NodeWithPathを作成し、currentNodeの子として追加
    ↓
CurrentNodeNotifierで現在ノードを更新
    ↓
Google以外のURL → BottomNodesNotifierでbottomNodesに追加
    ↓
NavigationActionPolicy.ALLOW を返却（遷移を許可）
```

### 3. ノード変更時の処理

```
ユーザー操作（履歴ノード選択）
    ↓
changeNode(node) 呼び出し
    ↓
CurrentNodeNotifierで現在ノードを更新
    ↓
UIレイヤーが自動的に再描画
```

### 4. NodeWithPathのパスID生成例

```
ルートノード: path = "0"
├─ 第1子: path = "1-1"
│  ├─ 第1子の第1子: path = "1-1-1"
│  └─ 第1子の第2子: path = "1-1-2"
└─ 第2子: path = "1-2"
   ├─ 第2子の第1子: path = "1-2-1"
   └─ 第2子の第2子: path = "1-2-2"
       └─ 第2子の第2子の第1子: path = "1-2-2-1"
```

## 設計上の考慮事項

### 1. 状態項目ごとの分離管理

- 各状態項目（ルートノード、現在ノード、URLタイトル、下部ノード、WebViewコントローラー）を個別のNotifierで管理
- BrowserControllerがこれらを統合して提供することで、状態と操作を分離
- 無駄な再初期化コストを削減し、必要な状態のみが更新される

### 2. イミュータビリティ

- `NodeWithPath`はイミュータブルな設計
- 状態変更は常に`copyWith()`や`addChild()`で新しいインスタンスを生成
- これによりRiverpodの変更検知が確実に動作し、予測可能な状態管理を実現

### 3. コールバックベースのイベント処理

- WebViewのイベント（ページ読み込み、リンククリック等）はコールバックで処理
- 各コールバックメソッドは適切な状態更新とビジネスロジックを実行
- 各Notifierを通じて状態を更新することで、関心の分離を実現

### 4. パスIDによるノード識別

- `NodeWithPath`はツリー構造内での位置を一意に識別するパスIDを持つ
- パスID（例: "0", "1-1", "1-2-3"）により、ノードの階層的な位置が明確
- 履歴の追跡、階層的なナビゲーション、ノードの検索が容易

### 5. 拡張性と保守性

- 状態項目ごとのNotifierにより、新しい状態の追加が容易
- イミュータブルなNodeWithPathにより、データの整合性を保証
- BrowserControllerを介した統一的なアクセスにより、UIレイヤーからの利用が簡潔

## Flutterアーキテクチャガイドラインへの準拠

本設計は以下の点でFlutter公式アーキテクチャに準拠しています：

1. **状態管理の明確な分離**: UIとロジックが明確に分離されている
2. **Riverpodの活用**: 推奨される状態管理ライブラリを使用
3. **イミュータブルな状態**: 状態はイミュータブルに設計され、予測可能
4. **Single Source of Truth**: 各状態に対して単一の情報源を持つ
5. **リアクティブな更新**: 状態変更が自動的にUIに反映される
6. **テスタビリティ**: ロジックが独立しており、ユニットテストが容易

## 今後の改善点

1. エラーハンドリング: WebViewのエラー処理を強化
2. パフォーマンス最適化: 大規模なツリー構造での処理の最適化
3. 永続化: 履歴データの永続化機能の追加（SharedPreferencesやローカルDBの利用）
4. テストカバレッジ: 各NotifierとBrowserControllerのユニットテストを追加
5. パスID検索: パスIDからNodeWithPathを効率的に検索する機能の追加

---

**作成日**: 2025年
**バージョン**: 1.0
