import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/tree/tree_id.dart';
part 'request_node_header.freezed.dart';

///NodeRepositoryにリクエストする際に必要な情報を表すクラス
@freezed
abstract class RequestNodeHeader with _$RequestNodeHeader {
  const factory RequestNodeHeader({
    required NodePath path,
    required TreeId treeId,
  }) = _RequestNodeHeader;
}
