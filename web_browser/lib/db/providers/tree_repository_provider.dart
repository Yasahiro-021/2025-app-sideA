import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/tree_repository.dart';

part 'tree_repository_provider.g.dart';

/// TreeRepositoryをProviderとして提供
/// 
/// ツリーの作成・取得・更新・削除などの操作に使用
@riverpod
TreeRepository treeRepositoryProvider(Ref ref) {
  return TreeRepository();
}
