import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_id.freezed.dart';

@freezed
abstract class TreeId with _$TreeId {
  @Assert('id >= 0', 'IDは0以上でなければなりません')
  const factory TreeId(int id) = _TreeId;
}
