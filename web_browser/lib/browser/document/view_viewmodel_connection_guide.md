# View-ViewModel接続作業手順書

## 📋 作業概要

**作業目的**: 実装済みのView層に対して、ViewModel層からデータを供給する接続作業を行う

**対象範囲**: 
- View層: 実装完了（データ供給元の変更のみ許可）
- ViewModel層: `BrowserController`を修正・拡張してViewに必要なデータを提供

**作業ブランチ**: `dev_browser_View-ViewModel_connection`

---

## 🎯 接続が必要なView一覧

### 1. AppBar領域

#### 1.1 ParentNode (`lib/browser/ui/app_bar/parent_node.dart`)
**必要なデータ**:
- `isEmpty`: 親ノードが存在するかどうか (bool)
- `parentName`: 親ノードの名前 (String)
- `buttonAction`: 親ノードに戻るアクション (Function)

**現状**: 23-25行目でハードコード
```dart
final bool isEmpty = false; // 仮の値
final String parentName = "サグラダ・ファミリア"; // 仮の値。空になりうる。
final Function() buttonAction = () {}; // 仮の値
```

#### 1.2 CurrentNodeText (`lib/browser/ui/app_bar/current_node_text.dart`)
**必要なデータ**:
- `currentNodeName`: 現在のノードの名前 (String)

**現状**: 13行目でハードコード
```dart
final currentNodeName = "current";//TODO 後ほど状態クラスを作成して統合する
```

### 2. BottomBar領域

#### 2.1 BottomNodeList (`lib/browser/ui/buttom_bar/bottom_node_list.dart`)
**必要なデータ**:
- `bottomNodes`: 子ノードのリスト (List<NodeWithPath>)

**現状**: 13-19行目でモックデータを使用
```dart
final List mockBottomNodes = [
  Node('Node 1aaaaaaaaaaaaaaa'),
  Node('Node 2'),
  // ...
];
```

#### 2.2 ChildNode (`lib/browser/ui/buttom_bar/child_node.dart`)
**必要な機能**:
- `onPressed`: ノードをクリックした際のアクション

**現状**: 30行目で空実装
```dart
onPressed: () {},
```

#### 2.3 StaySwitch (`lib/browser/ui/buttom_bar/stay_switch.dart`)
**接続状況**:
- ✅ 既に`browserControllerProvider`を使用中
- ⚠️ TODOコメントあり（19行目）

---

## 🏗️ ViewModel側の実装方針

### Phase 1: BrowserControllerの拡張（メソッド追加）

#### 必要な追加メソッド一覧

```dart
/// 親ノードの情報を取得
ParentNodeInfo getParentNodeInfo() {
  final parent = currentNode.parent as NodeWithPath?;
  return ParentNodeInfo(
    isEmpty: parent == null,
    parentName: parent?.name ?? '',
  );
}

/// 親ノードへ遷移
void navigateToParentNode() {
  // 既存実装あり（165-173行目）
  // 確認して必要に応じて修正
}

/// 特定のノードへ遷移（子ノードクリック時）
void navigateToNode(NodeWithPath node) {
  // WebViewを該当URLに遷移
  webViewController?.loadUrl(
    urlRequest: URLRequest(url: WebUri(node.url))
  );
  
  // 現在ノードを変更
  currentNodeNotifier.changeNode(node);
}
```

### Phase 2: 状態情報クラスの作成（オプション）

便利な統合クラスを作成することで、Viewからの参照を簡潔にします。

**ファイル作成**: `lib/browser/model/parent_node_info.dart`

```dart
/// 親ノード情報を表すデータクラス
class ParentNodeInfo {
  final bool isEmpty;
  final String parentName;

  const ParentNodeInfo({
    required this.isEmpty,
    required this.parentName,
  });
}
```

---

## 📝 作業手順

### ステップ1: ViewModel層の拡張

#### 1-1. ParentNodeInfo クラスの作成

**ファイル**: `lib/browser/model/parent_node_info.dart`

**作業内容**: 新規ファイルを作成し、以下のコードを記述

```dart
/// 親ノード情報を表すデータクラス
class ParentNodeInfo {
  final bool isEmpty;
  final String parentName;

  const ParentNodeInfo({
    required this.isEmpty,
    required this.parentName,
  });
}
```

---

#### 1-2. BrowserController にメソッドを追加

**ファイル**: `lib/browser/browser_controller.dart`

##### 1-2-1. インポート追加

ファイルの先頭（5行目あたり）に追加:

```dart
import 'model/parent_node_info.dart';
```

##### 1-2-2. getParentNodeInfo メソッド追加

165行目の `navigateToParentNode()` メソッドの**前**に追加:

```dart
  /// 親ノードの情報を取得
  ParentNodeInfo getParentNodeInfo() {
    final parent = currentNode.parent as NodeWithPath?;
    return ParentNodeInfo(
      isEmpty: parent == null,
      parentName: parent?.name ?? '',
    );
  }
```

##### 1-2-3. navigateToNode メソッド追加

`navigateToParentNode()` メソッドの**後**（174行目あたり）に追加:

```dart
  /// 指定されたノードへ遷移
  void navigateToNode(NodeWithPath node) {
    // WebViewを該当URLに遷移
    webViewController?.loadUrl(
      urlRequest: URLRequest(url: WebUri(node.url))
    );
    
    // 現在ノードを変更
    currentNodeNotifier.changeNode(node);
  }
```

---

### ステップ2: View層の接続

#### 2-1. ParentNode の接続

**ファイル**: `lib/browser/ui/app_bar/parent_node.dart`

##### 変更箇所: 10-25行目

**変更前**:
```dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    //状態の取得

    //TODO: 後ほど状態クラスを作成して統合する
    final bool isEmpty = false; // 仮の値
    final String parentName =
        "サグラダ・ファミリア"; // 仮の値。空になりうる。
    final Function() buttonAction = () {}; // 仮の値

    return Container(
```

**変更後**:
```dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    // ViewModelから状態を取得
    final controller = ref.read(browserControllerProvider);
    final parentInfo = controller.getParentNodeInfo();
    final bool isEmpty = parentInfo.isEmpty;
    final String parentName = parentInfo.parentName;
    final Function() buttonAction = controller.navigateToParentNode;

    return Container(
```

**必要なインポート**: 既に存在

---

#### 2-2. CurrentNodeText の接続

**ファイル**: `lib/browser/ui/app_bar/current_node_text.dart`

##### インポート追加（5行目あたりに追加）:

```dart
import 'package:web_browser/browser/browser_controller.dart';
```

##### 変更箇所: 10-13行目

**変更前**:
```dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    final currentNodeName = "current";//TODO 後ほど状態クラスを作成して統合する
```

**変更後**:
```dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    
    // ViewModelから現在ノード名を取得
    final currentNode = ref.watch(currentNodeNotifierProvider);
    final currentNodeName = currentNode.name;
```

---

#### 2-3. BottomNodeList の接続

**ファイル**: `lib/browser/ui/buttom_bar/bottom_node_list.dart`

##### インポート修正（6-7行目）

**変更前**:
```dart
import 'package:web_browser/browser/browser_controller.dart';
import 'package:web_browser/node/node.dart';
```

**変更後**:
```dart
import 'package:web_browser/browser/browser_controller.dart';
import 'package:web_browser/browser/model/node_with_path.dart';
```

##### 変更箇所: 13-32行目

**変更前**:
```dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List mockBottomNodes = [
      Node('Node 1aaaaaaaaaaaaaaa'),
      Node('Node 2'),
      Node('Node 3'),
      Node('Node 4'),
      Node('Node 5'),
    ];
    // if (bottomNodes.isEmpty) {
    if(mockBottomNodes.isEmpty) {
      return SizedBox(
        height: 32, // 子ノードが無い場合は縮小した高さ
        child: Center(
          child: Text(
            '子ノードなし',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mockBottomNodes.length,
      itemBuilder: (context, index) {
        final node = mockBottomNodes[index];
        return ChildNode(nodeName: node.name);
      },
    );
```

**変更後**:
```dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModelから実データを使用
    if (bottomNodes.isEmpty) {
      return SizedBox(
        height: 32, // 子ノードが無い場合は縮小した高さ
        child: Center(
          child: Text(
            '子ノードなし',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 12,
            ),
          ),
        ),
      );
    }
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: bottomNodes.length,
      itemBuilder: (context, index) {
        final node = bottomNodes[index] as NodeWithPath;
        return ChildNode(
          nodeName: node.name,
          node: node,
        );
      },
    );
```

---

#### 2-4. ChildNode の接続

**ファイル**: `lib/browser/ui/buttom_bar/child_node.dart`

##### インポート追加（3行目あたりに追加）:

```dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/browser_controller.dart';
import 'package:web_browser/browser/model/node_with_path.dart';
```

##### クラス定義の変更

**変更前**:
```dart
class ChildNode extends StatelessWidget {
  final String nodeName;

  const ChildNode({super.key, required this.nodeName});

  @override
  Widget build(BuildContext context) {
```

**変更後**:
```dart
class ChildNode extends ConsumerWidget {
  final String nodeName;
  final NodeWithPath node;

  const ChildNode({
    super.key, 
    required this.nodeName,
    required this.node,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
```

##### 変更箇所: onPressed の実装（30行目）

**変更前**:
```dart
          onPressed: () {},
```

**変更後**:
```dart
          onPressed: () {
            ref.read(browserControllerProvider).navigateToNode(node);
          },
```

---

#### 2-5. StaySwitch のTODO解消

**ファイル**: `lib/browser/ui/buttom_bar/stay_switch.dart`

##### 変更箇所: 19行目のコメント削除

**変更前**:
```dart
              ref.read(browserControllerProvider).toggleMultiAddEnabled();//TODO　Providerとの整合確認
```

**変更後**:
```dart
              ref.read(browserControllerProvider).toggleMultiAddEnabled();
```

**理由**: `toggleMultiAddEnabled` メソッドは既に `BrowserController` に実装済み（104-106行目）のため、接続は正常

---

### ステップ3: 動作確認

#### 3-1. ビルド確認

ターミナルで以下を実行:

```powershell
cd c:\Users\assan\Desktop\challe\2025-app\2025-app-sideA-1\web_browser
flutter pub get
flutter analyze
```

エラーがないことを確認。

#### 3-2. 実行確認

```powershell
flutter run
```

#### 3-3. 確認項目

- [ ] **AppBar中央部**: 親ノード名が表示される
- [ ] **AppBar中央部**: 現在ノード名が表示される
- [ ] **AppBar中央部**: 親ノードボタンを押すと親ノードに戻る
- [ ] **BottomBar**: 子ノードのリストが表示される
- [ ] **BottomBar**: 子ノードをタップすると該当ノードに遷移
- [ ] **BottomBar**: ADDスイッチのON/OFFが動作する

---

## 🔍 トラブルシューティング

### ケース1: ParentNodeInfo が見つからない

**症状**: `ParentNodeInfo` クラスのインポートエラー

**解決策**: 
1. `lib/browser/model/parent_node_info.dart` が正しく作成されているか確認
2. `browser_controller.dart` のインポート文が正しいか確認

### ケース2: bottomNodes が空のまま

**症状**: 子ノードが表示されない

**原因**: `currentNode` に子ノードが追加されていない可能性

**解決策**:
1. WebViewでリンクをクリックする
2. ADDスイッチをONにしてからリンクをクリック
3. `shouldOverrideUrlLoading` が正しく動作しているか確認

### ケース3: 親ノードボタンが動作しない

**症状**: ボタンを押してもページが戻らない

**確認項目**:
1. `navigateToParentNode` メソッドが正しく実装されているか（165-173行目）
2. `webViewController` が null でないか確認
3. `currentNode.parent` が存在するか確認

---

## 📊 作業チェックリスト

### Phase 1: ViewModel実装
- [ ] `parent_node_info.dart` ファイル作成
- [ ] `BrowserController` にインポート追加
- [ ] `getParentNodeInfo()` メソッド追加
- [ ] `navigateToNode()` メソッド追加

### Phase 2: View接続
- [ ] `ParentNode` の接続完了
- [ ] `CurrentNodeText` の接続完了
- [ ] `BottomNodeList` の接続完了
- [ ] `ChildNode` の接続完了
- [ ] `StaySwitch` のTODO解消

### Phase 3: 確認
- [ ] `flutter analyze` でエラーなし
- [ ] アプリ起動成功
- [ ] 全ての動作確認項目クリア

---

## 📝 補足事項

### データフロー図

```
┌─────────────────────────────────────────────────┐
│                  ViewModel層                     │
│                                                  │
│  BrowserController                               │
│    ├─ getParentNodeInfo()                        │
│    ├─ navigateToParentNode()                     │
│    ├─ navigateToNode(node)                       │
│    └─ toggleMultiAddEnabled()                    │
│                                                  │
│  各種Notifier                                     │
│    ├─ currentNodeNotifier                        │
│    ├─ bottomNodesNotifier                        │
│    └─ multiAddEnabledNotifier                    │
└─────────────────────────────────────────────────┘
                     ↓ データ供給
┌─────────────────────────────────────────────────┐
│                   View層                         │
│                                                  │
│  AppBar                                          │
│    ├─ ParentNode (親情報)                        │
│    └─ CurrentNodeText (現在ノード名)             │
│                                                  │
│  BottomBar                                       │
│    ├─ BottomNodeList (子リスト)                  │
│    ├─ ChildNode (個別ノード)                     │
│    └─ StaySwitch (ADDスイッチ)                   │
└─────────────────────────────────────────────────┘
```

### 命名規則

- **メソッド名**: 動詞から始まる（get, navigate, toggle など）
- **変数名**: 名詞または形容詞+名詞
- **クラス名**: パスカルケース
- **ファイル名**: スネークケース

### コメント規則

- すべてのpublicメソッドには日本語のドキュメントコメントを追加
- TODOコメントは解決後に削除

---

## ✅ 作業完了条件

以下すべての条件を満たした時点で作業完了とします:

1. ✅ すべてのTODOコメントが削除されている
2. ✅ モックデータが削除され、実データが使用されている
3. ✅ `flutter analyze` でエラー・警告がゼロ
4. ✅ アプリが正常に起動する
5. ✅ すべての動作確認項目がクリアされている

---

**作成日**: 2025年10月29日  
**対象ブランチ**: `dev_browser_View-ViewModel_connection`  
**作成者**: GitHub Copilot
