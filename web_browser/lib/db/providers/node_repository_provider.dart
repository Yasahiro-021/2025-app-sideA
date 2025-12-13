import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/node_repository.dart';

part 'node_repository_provider.g.dart';

/// NodeRepositoryをProviderとして提供
/// 
/// ノードの保存・取得・更新・削除などの操作に使用
@riverpod
NodeRepository nodeRepositoryProvider(Ref ref) {
  return NodeRepository();
}
