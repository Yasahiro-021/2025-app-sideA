# デバッグ用ツール

このディレクトリには、開発時のデバッグを支援するツールが含まれています。

## モックデータを使用したアプリ起動

モックデータ（事前に作成されたノードツリー）を使用してアプリを起動する場合:

```bash
flutter run -t lib/debug/main_debug.dart
```

### 通常の起動との違い

- **通常の起動** (`flutter run`): モックデータなし、空の状態から開始
- **デバッグ起動** (`flutter run -t lib/debug/main_debug.dart`): モックデータ有効、事前にノードが作成された状態で開始

### ファイル構成

- `main_debug.dart`: デバッグ用のエントリーポイント
- `debug_app.dart`: モックデータを初期化するラッパーウィジェット
- `mock_node_usecase.dart`: モックノードツリーの定義

### モックデータのカスタマイズ

`mock_node_usecase.dart`の`generatedNodes`配列を編集することで、モックデータの構造を変更できます。

```dart
var generatedNodes = <(NodePath, int)>[
  (NodePath.root, 3),        // ルート直下に3つノードを作成
  (NodePath(path: [0]), 2),  // ノード0の下に2つノードを作成
  // ...
];
```

## 注意事項

- これらのファイルは開発・デバッグ専用です
- リリースビルドには含まれません
- 本番コード（`lib/main.dart`）は一切変更されていません
