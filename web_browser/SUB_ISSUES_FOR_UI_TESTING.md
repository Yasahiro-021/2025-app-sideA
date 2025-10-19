# UIテストのためのサブIssue一覧

このドキュメントは、UIコンポーネントのテスト実装のために作成すべきサブIssueをまとめたものです。

## サブIssue作成の目的

- UIコンポーネントの動作を検証するテストコードを作成
- 期待される動作を明確にし、リグレッションを防ぐ
- コードの品質を保証し、今後の開発をスムーズにする

---

## サブIssue #1: ホーム画面 (MyHomePage) のウィジェットテスト実装

### タイトル
`UIテスト実装: ホーム画面 (MyHomePage)`

### 説明
ホーム画面のUIコンポーネントとナビゲーション機能のテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「1. ホーム画面 (MyHomePage)」セクションを参照。

### テスト項目
- [ ] AppBarのタイトル「適材適書」が正しく表示される
- [ ] "to browser!" ボタンが表示される
- [ ] "to treeview!" ボタンが表示される
- [ ] "to browser!" ボタンをタップするとブラウザ画面に遷移する
- [ ] "to treeview!" ボタンをタップするとツリービュー画面に遷移する

### 実装ファイル
- `test/ui/home_page_test.dart`

### 参照ファイル
- `lib/home_page.dart`
- `lib/router/router.dart`

### 優先度
**High**

### ラベル
`testing`, `ui`, `home-screen`

---

## サブIssue #2: ブラウザ画面 (BrowserViewWidget) のウィジェットテスト実装

### タイトル
`UIテスト実装: ブラウザ画面 (BrowserViewWidget)`

### 説明
ブラウザ画面のUIコンポーネント（AppBar、コンテンツエリア、ボトムバー）のテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「2. ブラウザ画面 (BrowserViewWidget)」セクションを参照。

### テスト項目
- [ ] AppBarが正しく表示される
- [ ] メニューボタンが正しいスタイルで表示される
- [ ] 親ノード表示エリアが正しく表示される
- [ ] 現在のノード表示エリアが正しく表示される
- [ ] ツリービューボタンが正しいスタイルで表示される
- [ ] コンテンツエリアに「コンテンツ領域」が表示される
- [ ] 検索バーが正しく表示される
- [ ] 検索テキストフィールドが入力可能
- [ ] 検索ボタンが表示される
- [ ] STAYボタンが正しいスタイルで表示される
- [ ] 3つの子ノードボタンが表示される
- [ ] 子ノードボタンが水平スクロール可能

### 実装ファイル
- `test/ui/browser/browser_view_widget_test.dart`

### 参照ファイル
- `lib/browser/ui/browser_view_widget.dart`

### 優先度
**High**

### ラベル
`testing`, `ui`, `browser-screen`

---

## サブIssue #3: ツリービュー画面 (TreeView) のウィジェットテスト実装

### タイトル
`UIテスト実装: ツリービュー画面 (TreeView)`

### 説明
ツリービュー画面のUIコンポーネントとInteractiveViewer機能のテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「3. ツリービュー画面 (TreeView)」セクションを参照。

### テスト項目
- [ ] AppBarに"Tree View"タイトルが表示される
- [ ] InteractiveViewerが正しく設定されている
- [ ] ルートノードが表示される
- [ ] モックノードが正しく渡される
- [ ] TreeDivisionウィジェットが表示される

### 実装ファイル
- `test/ui/tree_view/treeview_test.dart`

### 参照ファイル
- `lib/tree_view/treeview.dart`
- `lib/node/mocked_node.dart`

### 優先度
**High**

### ラベル
`testing`, `ui`, `tree-view`

---

## サブIssue #4: AppBarコンポーネント (ParentNode, CurrentNodeText) のウィジェットテスト実装

### タイトル
`UIテスト実装: AppBarコンポーネント (ParentNode, CurrentNodeText)`

### 説明
AppBarで使用されるコンポーネント（ParentNode、CurrentNodeText）のテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「4.1 ParentNode」と「4.2 CurrentNodeText」セクションを参照。

### テスト項目

#### ParentNode
- [ ] ノード名が正しく表示される
- [ ] 背景色がprimaryContainerである
- [ ] 角丸が8pxである
- [ ] 長いテキストが省略される（TextOverflow.ellipsis）

#### CurrentNodeText
- [ ] ノード名が正しく表示される
- [ ] テキストサイズが14である
- [ ] 長いテキストが省略される（TextOverflow.ellipsis）

### 実装ファイル
- `test/ui/browser/app_bar/parent_node_test.dart`
- `test/ui/browser/app_bar/current_node_text_test.dart`

### 参照ファイル
- `lib/browser/ui/app_bar/parent_node.dart`
- `lib/browser/ui/app_bar/current_node_text.dart`

### 優先度
**Medium**

### ラベル
`testing`, `ui`, `component`

---

## サブIssue #5: ChildNodeコンポーネントのウィジェットテスト実装

### タイトル
`UIテスト実装: ChildNodeコンポーネント`

### 説明
子ノード表示コンポーネント（ChildNode）のテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「4.3 ChildNode」セクションを参照。

### テスト項目
- [ ] ノード名が正しく表示される
- [ ] テキストサイズが14である
- [ ] 長いテキストが省略される（TextOverflow.ellipsis）

### 実装ファイル
- `test/ui/browser/child_node_test.dart`

### 参照ファイル
- `lib/browser/ui/child_node.dart`

### 優先度
**Medium**

### ラベル
`testing`, `ui`, `component`

---

## サブIssue #6: ツリーノードコンポーネント (NodeWidget) のウィジェットテスト実装

### タイトル
`UIテスト実装: ツリーノードコンポーネント (NodeWidget)`

### 説明
ツリービューのノードウィジェット（NodeWidget）のテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「4.4 NodeWidget」セクションを参照。

### テスト項目
- [ ] ノード名が表示される
- [ ] "Expand"ボタンが表示される
- [ ] ボタンタップで子ノードが生成される
- [ ] CustomPaintが正しく設定されている
- [ ] ノードサイズが正しく設定されている

### 実装ファイル
- `test/ui/tree_view/node_widget_test.dart`

### 参照ファイル
- `lib/tree_view/tree_sector/node_widget.dart`
- `lib/tree_view/data/ui_widgets.dart`

### 優先度
**Medium**

### ラベル
`testing`, `ui`, `tree-view`, `component`

---

## サブIssue #7: TreeDivisionコンポーネントのウィジェットテスト実装

### タイトル
`UIテスト実装: TreeDivisionコンポーネント`

### 説明
ツリーの区画を表すTreeDivisionコンポーネントのテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「4.5 TreeDivision」セクションを参照。

### テスト項目
- [ ] NodeWidgetが表示される
- [ ] LineSectorが表示される
- [ ] ChildrenTreeSectorが表示される
- [ ] 縦にコンポーネントが配置される
- [ ] 子ノード展開/折りたたみが機能する

### 実装ファイル
- `test/ui/tree_view/tree_division_test.dart`

### 参照ファイル
- `lib/tree_view/tree_sector/tree_division.dart`
- `lib/node/node.dart`

### 優先度
**Medium**

### ラベル
`testing`, `ui`, `tree-view`, `component`

---

## サブIssue #8: LineSectorコンポーネントのウィジェットテスト実装

### タイトル
`UIテスト実装: LineSectorコンポーネント`

### 説明
ノード間の線を描画するLineSectorコンポーネントのテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「4.6 LineSector」セクションを参照。

### テスト項目
- [ ] LineWidgetが生成される
- [ ] CustomPaintが正しく設定されている
- [ ] 線のスタイル（色、太さ）が正しい
- [ ] 複数の子ノードへの線が描画される
- [ ] オフセット計算が正しい

### 実装ファイル
- `test/ui/tree_view/line_sector_test.dart`

### 参照ファイル
- `lib/tree_view/tree_sector/child/line_sector.dart`

### 優先度
**Low**

### ラベル
`testing`, `ui`, `tree-view`, `component`

---

## サブIssue #9: ChildrenTreeSectorコンポーネントのウィジェットテスト実装

### タイトル
`UIテスト実装: ChildrenTreeSectorコンポーネント`

### 説明
子ノード群を管理するChildrenTreeSectorコンポーネントのテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「4.7 ChildrenTreeSector」セクションを参照。

### テスト項目
- [ ] 子ノードが水平に配置される
- [ ] 各子ノードがTreeDivisionとして表示される
- [ ] サイズが正しく記録される
- [ ] 親TreeDivisionとの連携が正しい

### 実装ファイル
- `test/ui/tree_view/children_tree_sector_test.dart`

### 参照ファイル
- `lib/tree_view/tree_sector/child/children_tree_sector.dart`
- `lib/tree_view/data/tree_sector_with_size.dart`

### 優先度
**Low**

### ラベル
`testing`, `ui`, `tree-view`, `component`

---

## サブIssue #10: ルーティング (Router) のテスト実装

### タイトル
`UIテスト実装: ルーティング (Router)`

### 説明
アプリケーションのルーティング機能のテストを実装します。

### 詳細
`UI_COMPONENT_TESTING_PLAN.md` の「5. ナビゲーション」セクションを参照。

### テスト項目
- [ ] HomeRouteが正しく動作する
- [ ] TreeViewRouteが正しく動作する
- [ ] BrowserViewRouteが正しく動作する
- [ ] ルート間の遷移が正しく動作する
- [ ] TreeViewRouteにNodeが正しく渡される
- [ ] 初期ルートが'/'である

### 実装ファイル
- `test/router/router_test.dart`

### 参照ファイル
- `lib/router/router.dart`
- `lib/router/router.g.dart`

### 優先度
**High**

### ラベル
`testing`, `routing`

---

## サブIssue作成時のテンプレート

各サブIssueを作成する際は、以下のテンプレートを使用してください：

```markdown
## 概要
[このサブIssueの目的を簡潔に記述]

## 詳細
`UI_COMPONENT_TESTING_PLAN.md` の該当セクションを参照してください。

## テスト項目
- [ ] [テスト項目1]
- [ ] [テスト項目2]
- [ ] [テスト項目3]
...

## 実装ファイル
- `[テストファイルのパス]`

## 参照ファイル
- `[実装ファイルのパス]`

## 受け入れ基準
- [ ] すべてのテスト項目が実装されている
- [ ] すべてのテストがパスする
- [ ] テストコードが`UI_COMPONENT_TESTING_PLAN.md`のガイドラインに従っている
- [ ] テストカバレッジが適切である

## 関連Issue
親Issue: [FlutterでのUI実装]
関連ドキュメント: `UI_COMPONENT_TESTING_PLAN.md`
```

---

## テスト実装の進め方

### ステップ1: 優先度HighのサブIssueから着手
1. サブIssue #1: ホーム画面
2. サブIssue #2: ブラウザ画面
3. サブIssue #3: ツリービュー画面
4. サブIssue #10: ルーティング

### ステップ2: 優先度Mediumのサブイssue
5. サブIssue #4: AppBarコンポーネント
6. サブIssue #5: ChildNodeコンポーネント
7. サブIssue #6: ツリーノードコンポーネント
8. サブIssue #7: TreeDivisionコンポーネント

### ステップ3: 優先度Lowのサブissue
9. サブIssue #8: LineSectorコンポーネント
10. サブIssue #9: ChildrenTreeSectorコンポーネント

### ステップ4: レビューと統合
- すべてのテストを実行して結果を確認
- テストカバレッジを測定
- ドキュメントを更新
- 必要に応じてテストを追加・修正

---

## テスト実装のベストプラクティス

1. **明確な命名規則**
   - テストの内容が分かる名前を付ける
   - 例: `should display app bar title correctly`

2. **AAA パターン (Arrange-Act-Assert)**
   - Arrange: テストの準備
   - Act: テスト対象の実行
   - Assert: 結果の検証

3. **独立性の確保**
   - 各テストは独立して実行可能にする
   - テスト間の依存関係を避ける

4. **適切なアサーション**
   - 期待される動作を明確にアサート
   - エラーメッセージを分かりやすくする

5. **モックとスタブの適切な使用**
   - 外部依存を最小化
   - テストの信頼性を向上

---

## まとめ

このドキュメントでは、UIコンポーネントのテスト実装のために作成すべき10個のサブIssueをまとめました。

- **優先度High**: 4個（ホーム画面、ブラウザ画面、ツリービュー画面、ルーティング）
- **優先度Medium**: 4個（AppBarコンポーネント、ChildNode、ツリーノード、TreeDivision）
- **優先度Low**: 2個（LineSector、ChildrenTreeSector）

各サブIssueには、テスト項目、実装ファイル、参照ファイル、優先度が明確に定義されています。

これらのサブIssueを順次実装することで、UIコンポーネントの品質が保証され、今後の開発がスムーズに進むようになります。
