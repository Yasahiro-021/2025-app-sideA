import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'note_group.freezed.dart';

@freezed
abstract class NodeGroup with _$NodeGroup {
  const factory NodeGroup({
    required NodePath parentPath,
    required int centerPoint,

    
  }) = _NodeGroup;
}