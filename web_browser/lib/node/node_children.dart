import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/node/node_path.dart';
part 'node_children.freezed.dart';

@freezed
///NodePathのリストを管理するクラス。子ノードの記録に使用。
abstract class NodeChildren with _$NodeChildren{

  ///`children`：子パスのリスト。子がない場合は空リストを使用。
  const factory NodeChildren({
    required List<NodePath> children }
  ) = _NodeChildren;
}