# UIコンポーネントテストのサブIssue発行について

## 概要

UIの雛形が完了したことを受け、実装されたUIコンポーネントを確認し、期待される動作をまとめました。
このドキュメントは、テスト実装を目的とするサブIssueを発行するためのサマリーです。

---

## 実装済みUIコンポーネントの確認結果

### 主要画面（3つ）

1. **ホーム画面 (MyHomePage)**
   - タイトル表示
   - ブラウザ画面への遷移ボタン
   - ツリービュー画面への遷移ボタン

2. **ブラウザ画面 (BrowserViewWidget)**
   - AppBar（メニューボタン、親ノード表示、現在ノード表示、ツリービューボタン）
   - コンテンツエリア
   - ボトムバー（検索バー、STAYボタン、子ノードボタン）

3. **ツリービュー画面 (TreeView)**
   - InteractiveViewerでツリー構造を表示
   - ズーム・パン機能
   - ノードの展開・折りたたみ機能

### UIコンポーネント（7つ）

1. **ParentNode** - 親ノード名表示
2. **CurrentNodeText** - 現在ノード名表示
3. **ChildNode** - 子ノード名表示
4. **NodeWidget** - ツリーノードの描画
5. **TreeDivision** - ツリー構造の区画
6. **LineSector** - ノード間の線描画
7. **ChildrenTreeSector** - 子ノード群の管理

### ルーティング

- GoRouterを使用した画面遷移
- 3つのルート（Home, Browser, TreeView）

---

## 作成したドキュメント

### 1. UI_COMPONENT_TESTING_PLAN.md

**内容:**
- 各UIコンポーネントの期待される動作の詳細
- テスト項目の一覧
- テスト実装ガイドライン
- テストファイル構成案

**目的:**
テスト実装時の参照ドキュメントとして使用

### 2. SUB_ISSUES_FOR_UI_TESTING.md

**内容:**
- 発行すべき10個のサブIssueの詳細
- 各サブIssueのテスト項目
- 優先度の設定
- 実装の進め方

**目的:**
GitHubでサブIssueを発行する際の参照ドキュメント

---

## 発行すべきサブIssue一覧（10個）

### 優先度 High（4個）

1. **サブIssue #1: ホーム画面のテスト**
   - タイトル表示
   - ボタン表示
   - ナビゲーション機能
   
2. **サブIssue #2: ブラウザ画面のテスト**
   - AppBar表示
   - コンテンツエリア表示
   - ボトムバー表示と機能
   
3. **サブIssue #3: ツリービュー画面のテスト**
   - InteractiveViewer設定
   - ノード表示
   - モックノード連携
   
4. **サブIssue #10: ルーティングのテスト**
   - 各ルートの動作
   - 画面遷移
   - パラメータ渡し

### 優先度 Medium（4個）

5. **サブIssue #4: AppBarコンポーネントのテスト**
   - ParentNode表示とスタイル
   - CurrentNodeText表示とスタイル
   
6. **サブIssue #5: ChildNodeコンポーネントのテスト**
   - ノード名表示
   - テキストスタイル
   
7. **サブIssue #6: ツリーノードコンポーネントのテスト**
   - NodeWidget表示
   - Expandボタン機能
   - CustomPaint描画
   
8. **サブIssue #7: TreeDivisionコンポーネントのテスト**
   - コンポーネント配置
   - 展開/折りたたみ機能

### 優先度 Low（2個）

9. **サブIssue #8: LineSectorコンポーネントのテスト**
   - 線の描画
   - スタイル設定
   - オフセット計算
   
10. **サブIssue #9: ChildrenTreeSectorコンポーネントのテスト**
    - 子ノード配置
    - サイズ記録

---

## サブIssue発行時の推奨事項

### 各サブIssueに含めるべき情報

1. **概要**
   - テストの目的を簡潔に説明

2. **テスト項目**
   - チェックリスト形式でテスト項目を列挙

3. **実装ファイル**
   - 作成すべきテストファイルのパス

4. **参照ファイル**
   - テスト対象の実装ファイルのパス

5. **受け入れ基準**
   - サブIssueをクローズするための条件

6. **関連ドキュメント**
   - `UI_COMPONENT_TESTING_PLAN.md`へのリンク

### ラベルの推奨

- `testing` - すべてのサブIssueに付与
- `ui` - UI関連のテスト
- `home-screen`, `browser-screen`, `tree-view` - 画面別
- `component` - コンポーネント単体テスト
- `routing` - ルーティングテスト

---

## テスト実装の進め方

### フェーズ1: 基本画面テスト（優先度High）

**期間**: 1-2週間

1. ホーム画面のテスト実装
2. ブラウザ画面のテスト実装
3. ツリービュー画面のテスト実装
4. ルーティングのテスト実装

**成果物**:
- 4つの画面/機能のテストファイル
- 基本的な画面遷移の保証

### フェーズ2: コンポーネント詳細テスト（優先度Medium）

**期間**: 1-2週間

5. AppBarコンポーネントのテスト実装
6. ChildNodeコンポーネントのテスト実装
7. ツリーノードコンポーネントのテスト実装
8. TreeDivisionコンポーネントのテスト実装

**成果物**:
- 各UIコンポーネントの詳細テスト
- コンポーネントの独立性の保証

### フェーズ3: 高度なコンポーネントテスト（優先度Low）

**期間**: 1週間

9. LineSectorコンポーネントのテスト実装
10. ChildrenTreeSectorコンポーネントのテスト実装

**成果物**:
- 描画ロジックのテスト
- 完全なテストカバレッジ

---

## テスト実装のガイドライン

### 基本構造

すべてのウィジェットテストは以下の構造に従います：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('ComponentName Tests', () {
    testWidgets('should display component correctly', 
      (WidgetTester tester) async {
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

### テストの命名規則

- 英語で明確に記述
- `should` で始める
- 例: `should display app bar title correctly`

### AAA パターン

1. **Arrange**: テストの準備（ウィジェットのビルド）
2. **Act**: テスト対象の実行（タップ、入力など）
3. **Assert**: 結果の検証（expectでアサート）

---

## 期待される成果

### 短期的成果

- UIコンポーネントの動作が保証される
- リグレッションテストの基盤が整う
- コードの品質が向上する

### 長期的成果

- 新機能追加時の安全性向上
- リファクタリングの容易化
- ドキュメントとしての役割

---

## 次のステップ

1. **このドキュメントをレビュー**
   - テスト項目の妥当性を確認
   - 追加すべきテストがあれば追記

2. **サブIssueの発行**
   - GitHubで10個のサブIssueを作成
   - `SUB_ISSUES_FOR_UI_TESTING.md`を参照

3. **テスト実装の開始**
   - 優先度Highのサブイssueから着手
   - `UI_COMPONENT_TESTING_PLAN.md`を参照しながら実装

4. **継続的なレビュー**
   - 実装したテストをレビュー
   - 必要に応じてテストを追加・修正

---

## 参考資料

- **UI_COMPONENT_TESTING_PLAN.md** - テスト項目と期待される動作の詳細
- **SUB_ISSUES_FOR_UI_TESTING.md** - サブIssue発行の詳細
- **Flutter テストドキュメント**: https://docs.flutter.dev/testing
- **flutter_test パッケージ**: https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html

---

## まとめ

実装済みのUIコンポーネントを確認し、以下を完了しました：

✅ **3つの主要画面**の期待される動作を文書化
✅ **7つのUIコンポーネント**の期待される動作を文書化
✅ **10個のサブIssue**の詳細を作成
✅ **テスト実装ガイドライン**を作成
✅ **実装の進め方**を提案

これらのドキュメントを基に、GitHubでサブIssueを発行し、テスト実装を進めることができます。
