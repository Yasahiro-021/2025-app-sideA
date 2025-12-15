import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'group.freezed.dart';
@freezed
abstract class Group with _$Group {
  const factory Group({
    required NodePath path,
    required List<NodePath> elements,
    required List<Group> childrenGroup,
    required double width,
    required double treeWidth,
  }) = _Group;
}