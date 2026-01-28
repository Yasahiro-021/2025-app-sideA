# CreateTreeUsecase 実装ドキュメント

Not viewed

作成日時: 2026-01-19

## 概要
新しいツリーを作成するUsecaseの実装が完了しました。

## 実装内容

### ファイル
- `lib/core/usecase/create_tree_usecase.dart` - メインの実装
- `lib/core/usecase/create_tree_usecase.g.dart` - 自動生成コード
- `test/core/usecase/create_tree_usecase_test.dart` - テストコード

### 機能
1. **バリデーション**
   - 入力文字列の前後の空白を自動的に除去
   - 空文字列または空白のみの入力をエラーとして処理

2. **重複チェック**
   - TreeRepository.getTreeByNameを使用して同名チェック
   - 同名のツリーが存在する場合はエラーを返す

3. **ツリー作成**
   - TreeRepository.createTreeでDB保存
   - 作成されたツリーIDを返す

### エラーハンドリング
- `CreateTreeError`列挙型で2種類のエラーを定義：
  - `emptyName`: 空文字列または空白のみ
  - `duplicateName`: 同名ツリーが既に存在

- `CreateTreeResult`クラスで結果を返却：
  - 成功時: `treeId`にIDが設定される
  - 失敗時: `error`にエラー種別が設定される

## テストケース
1. ✅ 正常系: 有効な名前でツリーIDが返る
2. ✅ 異常系1: 空文字でエラー
3. ✅ 異常系1: 空白のみでエラー
4. ✅ 異常系1: タブや改行のみでエラー
5. ✅ 異常系2: 同名ツリーが存在する場合にエラー
6. ✅ 前後の空白を除去して処理される
7. ✅ 前後の空白を除去した結果が重複する場合はエラー
8. ✅ 異なる名前のツリーは複数作成できる

## 手動テスト手順（Flutter環境が必要）

### 1. コード生成
```bash
cd web_browser
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. テスト実行
```bash
flutter test test/core/usecase/create_tree_usecase_test.dart
```

### 3. 全体のテスト実行
```bash
flutter test
```

## 使用例

```dart
final container = ProviderContainer();
final usecase = container.read(createTreeUsecaseProvider.notifier);

// 正常なケース
final result = await usecase.create('新しいツリー');
if (result.isSuccess) {
  print('ツリーID: ${result.treeId}');
}

// エラーケース
final errorResult = await usecase.create('');
if (!errorResult.isSuccess) {
  switch (errorResult.error) {
    case CreateTreeError.emptyName:
      print('ツリー名が空です');
      break;
    case CreateTreeError.duplicateName:
      print('同名のツリーが既に存在します');
      break;
  }
}
```

## 備考
- 初期ルートノード作成オプションは要検討のため、今回は実装していません
- UIの変更は含まれていません（仕様通り）
- 既存のTreeRepositoryのメソッドを活用しています
