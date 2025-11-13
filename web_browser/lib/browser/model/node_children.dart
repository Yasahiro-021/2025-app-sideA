import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/browser/model/node_with_path.dart';
part 'node_children.freezed.dart';

@freezed
abstract class NodeChildren with _$NodeChildren{
  const factory NodeChildren({
    required UnmodifiableListView<NodeWithPath> children }
  ) = _NodeChildren;
}