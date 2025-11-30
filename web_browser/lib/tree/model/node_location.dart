
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_location.freezed.dart';

@freezed
abstract class NodeLocation  with _$NodeLocation {
  const factory NodeLocation({
    required int depth,
    required int index,
  }) = _NodeLocation;
}