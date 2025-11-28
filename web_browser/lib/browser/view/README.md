# Browser View Module

このディレクトリには、Webブラウザ機能のView層の実装が含まれています。

## ディレクトリ構造

```
view/
├── browser_view.dart                    # メインView（エントリーポイント）
└── components/                          # UIコンポーネント
    ├── app_bar/                         # AppBar関連
    │   ├── browser_app_bar_view.dart    # AppBarのメインView
    │   ├── menu_button_view.dart        # メニューボタン
    │   ├── center_node_display_view.dart # 中央のノード表示領域
    │   ├── tree_button/                 # ツリー画面遷移ボタン
    │   │   ├── tree_button_view.dart
    │   │   └── tree_button_viewmodel.dart
    │   ├── parent_node/                 # 親ノード表示・遷移
    │   │   ├── parent_node_view.dart
    │   │   └── parent_node_viewmodel.dart
    │   └── current_node_text/           # 現在ノード名表示
    │       ├── current_node_text_view.dart
    │       └── current_node_text_viewmodel.dart
    ├── bottom_bar/                      # 下部バー関連
    │   ├── browser_bottom_bar_view.dart # 下部バーのメインView
    │   ├── bottom_node_list_view.dart   # 子ノードリスト
    │   ├── stay_switch/                 # 複数追加モード切替
    │   │   ├── stay_switch_view.dart
    │   │   └── stay_switch_viewmodel.dart
    │   └── child_node/                  # 子ノードボタン
    │       ├── child_node_view.dart
    │       └── child_node_viewmodel.dart
    └── body/                            # Body関連
        ├── browser_web_view/            # WebView本体
        │   ├── browser_web_view_view.dart
        │   └── browser_web_view_viewmodel.dart
        └── floating_search_bar/         # フローティング検索バー
            ├── floating_search_bar_view.dart
            └── floating_search_bar_viewmodel.dart
```

## MVVM構造

本モジュールは、MVVM（Model-View-ViewModel）アーキテクチャに準拠しています。

### View
- ユーザーインターフェースの表示を担当
- ViewModelから状態を取得し、ユーザーの操作をViewModelに委譲
- 命名規則: `{機能名}_view.dart` / クラス名: `{機能名}View`

### ViewModel
- ビジネスロジックと状態管理を担当
- ViewとModelの仲介役
- 命名規則: `{機能名}_viewmodel.dart` / クラス名: `{機能名}ViewModel`

### レイアウトのみのWidget
- 処理を持たず、他のWidgetを配置するだけのWidget
- ViewModelは不要
- 例: `BrowserAppBarView`, `CenterNodeDisplayView`, `BrowserBottomBarView`

## 主要コンポーネント

### BrowserView
- ブラウザ画面のエントリーポイント
- Scaffold構造を定義し、AppBar、Body、BottomBarを配置

### AppBar関連
- **MenuButtonView**: メニューボタン（未実装）
- **TreeButtonView/ViewModel**: ルートノードを表示し、ツリー画面へ遷移
- **ParentNodeView/ViewModel**: 親ノードを表示し、親ノードへ遷移
- **CurrentNodeTextView/ViewModel**: 現在のノード名を表示

### BottomBar関連
- **StaySwitchView/ViewModel**: 複数追加モードの切り替えスイッチ
- **ChildNodeView/ViewModel**: 子ノードボタン（クリックで子ノードへ遷移）

### Body関連
- **BrowserWebViewView/ViewModel**: WebView本体（URLの読み込みと各種イベント処理）
- **FloatingSearchBarView/ViewModel**: フローティング検索バー（展開/折りたたみ、検索実行）

## 状態管理

状態管理は、`view_model/notifiers/`ディレクトリ内のNotifierクラスによって行われます。

- `RootNodeNotifier`: ルートノードの状態
- `CurrentNodeNotifier`: 現在のノードの状態
- `BottomNodesNotifier`: 下部バーの子ノードリスト
- `MultiAddEnabledNotifier`: 複数追加モードの有効/無効
- `SearchBarExpandedNotifier`: 検索バーの展開状態
- `SearchWordNotifier`: 検索ワード
- その他

ViewModelは、これらのNotifierを通じて状態にアクセスし、更新します。

## 設計原則

1. **関心の分離**: UI（View）とロジック（ViewModel）を明確に分離
2. **単一責任の原則**: 各コンポーネントは明確な責任を持つ
3. **再利用性**: 小さなコンポーネントに分割し、再利用可能に
4. **テスト容易性**: ViewModelは独立してテスト可能
5. **Material 3準拠**: Material 3デザインガイドラインに準拠
