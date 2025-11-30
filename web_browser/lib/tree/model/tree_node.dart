import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node.freezed.dart';

@freezed
abstract class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String title,
    required String date,
  }) = _TreeNode;
}