
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node_state.freezed.dart';

@freezed
class TreeNodeState with _$TreeNodeState {
  const factory TreeNodeState({
    required String title,
    required String date,
    required double fromTopDistance,
    required double fromLeftDistance,
  }) = _TreeNodeState;
}