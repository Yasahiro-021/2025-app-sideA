import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/browser/model/node_with_path.dart';
part 'node_children.freezed.dart';

@freezed
///NodeWithPathのリストを管理するクラス。子ノードの記録に使用。
abstract class NodeChildren with _$NodeChildren{

  ///`children`：子ノードのリスト。子がない場合は空リストを使用。
  const factory NodeChildren({
    required List<NodeWithPath> children }
  ) = _NodeChildren;
}