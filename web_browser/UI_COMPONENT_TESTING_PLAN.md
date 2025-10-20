# UI コンポーネントテスト計画書

このドキュメントは、実装されたFlutter UIコンポーネントの期待される動作をまとめ、テスト実装のためのガイドラインを提供します。

## 概要

現在の実装では、以下の主要な画面とコンポーネントが完成しています：
1. ホーム画面 (MyHomePage)
2. ブラウザ画面 (BrowserViewWidget)
3. ツリービュー画面 (TreeView)

---

## 1. ホーム画面 (MyHomePage)

### ファイル: `lib/home_page.dart`

### 期待される動作:

#### UI要素
- AppBarに「適材適書」というタイトルが表示される
- 2つのボタンが縦に配置される
  - "to browser!" ボタン
  - "to treeview!" ボタン

#### インタラクション
1. **"to browser!" ボタン**
   - タップするとブラウザ画面に遷移する
   - 遷移先: `/browser` ルート

2. **"to treeview!" ボタン**
   - タップするとツリービュー画面に遷移する
   - 遷移先: `/tree` ルート
   - モックノード（深さ10、幅3）を引数として渡す

### テスト項目
- [ ] AppBarのタイトルが正しく表示される
- [ ] "to browser!" ボタンが表示される
- [ ] "to treeview!" ボタンが表示される
- [ ] "to browser!" ボタンをタップするとブラウザ画面に遷移する
- [ ] "to treeview!" ボタンをタップするとツリービュー画面に遷移する

---

## 2. ブラウザ画面 (BrowserViewWidget)

### ファイル: `lib/browser/ui/browser_view_widget.dart`

### 期待される動作:

#### 2.1 AppBar

##### UI要素
1. **メニューボタン（左側）**
   - サイズ: 56x56
   - 角丸: 16px
   - 背景色: primary色
   - アイコン: メニューアイコン (Icons.menu)
   - アイコン色: onPrimary色

2. **親ノード表示エリア（中央上部）**
   - コンポーネント: ParentNode
   - 初期値: "親"
   - FittedBoxで包まれている
   - 背景色: primaryContainer
   - 角丸: 8px
   - テキストサイズ: 16
   - オーバーフロー: ellipsis

3. **現在のノード表示エリア（中央下部）**
   - コンポーネント: CurrentNodeText
   - 初期値: "current node"
   - FittedBoxで包まれている
   - テキストサイズ: 14
   - オーバーフロー: ellipsis

4. **ツリービューボタン（右側）**
   - サイズ: 56x56
   - 角丸: 16px
   - 背景色: primary色
   - アイコン: アカウントツリーアイコン (Icons.account_tree)
   - アイコン色: onPrimary色

##### インタラクション
- メニューボタン: タップ時にメニュー処理（未実装）
- ツリービューボタン: タップ時にルート表示処理（未実装）

#### 2.2 コンテンツエリア

##### UI要素
- 背景色: 白
- 中央に「コンテンツ領域」というテキストが表示される

#### 2.3 ボトムナビゲーションバー

##### 検索バーセクション

###### UI要素
1. **検索コンテナ**
   - マージン: 全方向16px
   - パディング: 水平16px、垂直8px
   - 背景色: surfaceContainerHighest
   - 角丸: 12px
   - 枠線: outline色

2. **"Search"ラベル**
   - テキストサイズ: 12
   - 色: onSurfaceVariant

3. **検索入力行**
   - 検索アイコン (Icons.search)
   - テキストフィールド
     - ヒント: "検索ワードを入力"
     - ボーダー: なし
   - 検索ボタン
     - 背景色: primary
     - 前景色: onPrimary
     - 角丸: 8px
     - ラベル: "search"
     - アイコン付き

###### インタラクション
- 検索ボタン: タップ時に検索処理（未実装）

##### 子ノードボタンセクション

###### UI要素
1. **STAYボタン（固定）**
   - 幅: 180px
   - 右マージン: 16px
   - 背景色: secondaryContainer
   - 角丸: 50px（カプセル形状）
   - 枠線: outline色、幅2px
   - 内容:
     - 円形アイコン（直径60px）
       - 背景色: secondary
       - テキスト: "STAY"
       - テキスト色: onSecondary
       - フォントウェイト: bold
       - フォントサイズ: 12
     - アカウントツリーアイコン
       - サイズ: 30
       - 色: onSecondaryContainer

2. **子ノードボタン（スクロール可能）**
   - 高さ: 100px
   - 水平スクロール可能
   - 3つの子ボタン（"子"）が表示される
   - 各ボタン:
     - 幅: 150px
     - 右マージン: 16px
     - 背景色: surfaceContainerHighest
     - 角丸: 50px（カプセル形状）
     - 枠線: outline色
     - テキスト: "子"
     - テキストサイズ: 32
     - テキスト色: onSurfaceVariant

###### インタラクション
- STAYボタン: タップ時の動作（未実装）
- 子ノードボタン: タップ時にノード移動（未実装）
- 水平スクロール: 子ノードが多い場合にスクロール可能

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

---

## 3. ツリービュー画面 (TreeView)

### ファイル: `lib/tree_view/treeview.dart`

### 期待される動作:

#### 3.1 メイン画面

##### UI要素
1. **AppBar**
   - タイトル: "Tree View"

2. **InteractiveViewer**
   - 制約なし (constrained: false)
   - バウンダリマージン: 全方向100px
   - 最大スケール: 1000
   - 最小スケール: 0.001
   - ピンチズーム、パン操作が可能

3. **TreeDivision（ツリー構造の表示）**
   - ルートノードとその子孫を再帰的に表示
   - 各ノードはTreeDivisionウィジェットとして表示

##### インタラクション
- ピンチズームでツリーの拡大・縮小
- ドラッグでツリーの移動
- ノードの"Expand"ボタンで子ノードを展開

### テスト項目
- [ ] AppBarに"Tree View"タイトルが表示される
- [ ] InteractiveViewerが正しく設定されている
- [ ] ルートノードが表示される
- [ ] ピンチズームが機能する
- [ ] パン操作が機能する

---

## 4. UIコンポーネント詳細

### 4.1 ParentNode

#### ファイル: `lib/browser/ui/app_bar/parent_node.dart`

#### 期待される動作:
- 親ノードの名前を表示する
- 背景色: primaryContainer
- 角丸: 8px
- テキストサイズ: 16
- オーバーフロー時は省略記号（...）で表示

#### テスト項目
- [ ] ノード名が正しく表示される
- [ ] 背景色がprimaryContainerである
- [ ] 角丸が8pxである
- [ ] 長いテキストが省略される

---

### 4.2 CurrentNodeText

#### ファイル: `lib/browser/ui/app_bar/current_node_text.dart`

#### 期待される動作:
- 現在のノード名を表示する
- テキストサイズ: 14
- オーバーフロー時は省略記号（...）で表示

#### テスト項目
- [ ] ノード名が正しく表示される
- [ ] テキストサイズが14である
- [ ] 長いテキストが省略される

---

### 4.3 ChildNode

#### ファイル: `lib/browser/ui/child_node.dart`

#### 期待される動作:
- 子ノードの名前を表示する
- テキストサイズ: 14
- オーバーフロー時は省略記号（...）で表示

#### テスト項目
- [ ] ノード名が正しく表示される
- [ ] テキストサイズが14である
- [ ] 長いテキストが省略される

---

### 4.4 NodeWidget

#### ファイル: `lib/tree_view/tree_sector/node_widget.dart`

#### 期待される動作:
- ノードを円形で描画
- ノード名を表示
- "Expand"ボタンを表示
- ボタンタップで子ノードを展開

#### テスト項目
- [ ] ノード名が表示される
- [ ] "Expand"ボタンが表示される
- [ ] ボタンタップで子ノードが生成される
- [ ] 円形が正しく描画される

---

### 4.5 TreeDivision

#### ファイル: `lib/tree_view/tree_sector/tree_division.dart`

#### 期待される動作:
- ノード、線、子ノードを縦に配置
- 子ノードへの展開/折りたたみを管理
- レンダリング後にサイズを記録

#### テスト項目
- [ ] NodeWidgetが表示される
- [ ] LineSectorが表示される
- [ ] ChildrenTreeSectorが表示される
- [ ] サイズが正しく記録される

---

### 4.6 LineSector

#### ファイル: `lib/tree_view/tree_sector/child/line_sector.dart`

#### 期待される動作:
- 親ノードから子ノードへの線を描画
- 複数の子ノードがある場合、それぞれに線を描画
- 線の色: 黒
- 線の太さ: 2.0

#### テスト項目
- [ ] 線が正しく描画される
- [ ] 複数の子ノードへの線が描画される
- [ ] 線の色が黒である
- [ ] 線の太さが2.0である

---

### 4.7 ChildrenTreeSector

#### ファイル: `lib/tree_view/tree_sector/child/children_tree_sector.dart`

#### 期待される動作:
- 子ノードを水平に配置
- 各子ノードはTreeDivisionとして表示
- 子ノードのサイズを記録して親に通知

#### テスト項目
- [ ] 子ノードが水平に配置される
- [ ] 各子ノードが表示される
- [ ] サイズが正しく記録される

---

## 5. ナビゲーション

### ファイル: `lib/router/router.dart`

### 期待される動作:

#### ルート定義
1. **HomeRoute (`/`)**
   - MyHomePageを表示

2. **TreeViewRoute (`/tree`)**
   - TreeViewを表示
   - Nodeオブジェクトを引数として受け取る

3. **BrowserViewRoute (`/browser`)**
   - BrowserViewWidgetを表示

#### ルート階層
```
/ (Home)
├── /tree (TreeView)
└── /browser (BrowserView)
    └── /tree (TreeView)
```

### テスト項目
- [ ] HomeRouteが正しく動作する
- [ ] TreeViewRouteが正しく動作する
- [ ] BrowserViewRouteが正しく動作する
- [ ] ルート間の遷移が正しく動作する
- [ ] TreeViewRouteにNodeが正しく渡される

---

## 6. テスト実装の優先順位

### 優先度 High
1. ホーム画面の基本表示テスト
2. ブラウザ画面の基本表示テスト
3. ツリービュー画面の基本表示テスト
4. ナビゲーションテスト

### 優先度 Medium
5. AppBarコンポーネントのテスト（ParentNode, CurrentNodeText）
6. ボトムバーコンポーネントのテスト
7. ツリーコンポーネントのテスト（NodeWidget, TreeDivision）

### 優先度 Low
8. インタラクション詳細テスト
9. スタイルの詳細テスト
10. エッジケースのテスト

---

## 7. テストファイル構成案

```
test/
├── ui/
│   ├── home_page_test.dart                    # ホーム画面テスト
│   ├── browser/
│   │   ├── browser_view_widget_test.dart      # ブラウザ画面テスト
│   │   ├── app_bar/
│   │   │   ├── parent_node_test.dart          # ParentNodeテスト
│   │   │   └── current_node_text_test.dart    # CurrentNodeTextテスト
│   │   └── child_node_test.dart               # ChildNodeテスト
│   └── tree_view/
│       ├── treeview_test.dart                 # TreeViewテスト
│       ├── node_widget_test.dart              # NodeWidgetテスト
│       ├── tree_division_test.dart            # TreeDivisionテスト
│       ├── line_sector_test.dart              # LineSectorテスト
│       └── children_tree_sector_test.dart     # ChildrenTreeSectorテスト
└── router/
    └── router_test.dart                        # ルーティングテスト
```

---

## 8. テスト実装ガイドライン

### 8.1 ウィジェットテストの基本構造

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('ComponentName Tests', () {
    testWidgets('should display component correctly', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: YourWidget(),
          ),
        ),
      );

      // Verify
      expect(find.text('Expected Text'), findsOneWidget);
    });
  });
}
```

### 8.2 Riverpodを使用したテスト

```dart
testWidgets('should work with notifiers', (WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        home: YourWidget(),
      ),
    ),
  );

  // Notifierの状態を確認
  final container = ProviderScope.containerOf(
    tester.element(find.byType(YourWidget)),
  );
  
  expect(container.read(yourNotifier), expectedValue);
});
```

### 8.3 ナビゲーションのテスト

```dart
testWidgets('should navigate to another screen', (WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp.router(
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
      ),
    ),
  );

  // ボタンをタップ
  await tester.tap(find.text('to browser!'));
  await tester.pumpAndSettle();

  // 遷移先の画面が表示されているか確認
  expect(find.text('Expected Screen Text'), findsOneWidget);
});
```

---

## 9. まとめ

このドキュメントでは、実装されたFlutter UIコンポーネントの期待される動作と、テスト実装のためのガイドラインをまとめました。

次のステップ:
1. このドキュメントに基づいてサブIssueを作成
2. 各サブIssueに対してテストを実装
3. テストの実行と結果の検証
4. 必要に応じてコンポーネントの修正

すべてのテストが完了すれば、UIコンポーネントの品質が保証され、今後の開発でリグレッションを防ぐことができます。
