import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'node_group.freezed.dart';

@freezed
abstract class NodeGroup with _$NodeGroup {
  NodeGroup._();

  factory NodeGroup({
    required NodePath parentPath,
    required int width,
  }) = _NodeGroup;

  int get depth => parentPath.depth +1;
}