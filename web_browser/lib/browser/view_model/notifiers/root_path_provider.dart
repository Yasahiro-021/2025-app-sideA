import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'root_path_provider.g.dart';

@riverpod
NodePath rootPath(Ref ref) {
  // ルートノードのパスを返す（空のパス）
  return NodePath(path: []);
}
