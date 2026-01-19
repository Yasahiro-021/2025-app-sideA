import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/db/providers/tree_repository_provider.dart';

part 'create_tree_usecase.g.dart';

/// ツリー作成時のエラー種別
enum CreateTreeError {
  /// 空文字列または空白のみの名前
  emptyName,
  /// 同名のツリーが既に存在
  duplicateName,
}

/// ツリー作成結果
class CreateTreeResult {
  /// 成功時のツリーID
  final int? treeId;
  /// エラー時のエラー種別
  final CreateTreeError? error;

  const CreateTreeResult.success(int id)
      : treeId = id,
        error = null;

  const CreateTreeResult.failure(CreateTreeError err)
      : treeId = null,
        error = err;

  /// 成功したかどうか
  bool get isSuccess => treeId != null;
}

@riverpod
class CreateTreeUsecase extends _$CreateTreeUsecase {
  @override
  CreateTreeUsecase build() {
    return this;
  }

  /// 新しいツリーを作成する
  /// 
  /// [name] ツリー名
  /// 
  /// 前処理として前後の空白を除去し、
  /// 空文字列または全空白の場合はエラーを返す。
  /// 同名のツリーが既に存在する場合もエラーを返す。
  /// 
  /// 成功時は作成されたツリーのIDを含むCreateTreeResultを返す。
  Future<CreateTreeResult> create(String name) async {
    // 1. 前後の空白を除去
    final trimmedName = name.trim();

    // 2. 空文字列チェック
    if (trimmedName.isEmpty) {
      return const CreateTreeResult.failure(CreateTreeError.emptyName);
    }

    // 3. 重複チェック
    final repository = ref.read(treeRepositoryProviderProvider);
    final existingTree = await repository.getTreeByName(trimmedName);
    if (existingTree != null) {
      return const CreateTreeResult.failure(CreateTreeError.duplicateName);
    }

    // 4. ツリーを作成
    final treeId = await repository.createTree(trimmedName);

    return CreateTreeResult.success(treeId);
  }
}
