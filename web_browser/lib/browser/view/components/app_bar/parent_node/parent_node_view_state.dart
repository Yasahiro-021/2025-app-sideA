
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/node/node_path.dart';
part 'parent_node_view_state.freezed.dart';
/// 親ノードの状態を保持するクラス

@freezed
abstract class ParentNodeState with _$ParentNodeState {

  const factory ParentNodeState({
    required String parentTitle,
    required NodePath parentPath,
    required Function navigateToParent,
  }) = _ParentNodeState
  ;

}