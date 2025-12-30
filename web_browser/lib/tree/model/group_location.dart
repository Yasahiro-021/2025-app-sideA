import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_location.freezed.dart';

@freezed
abstract class GroupLocation with _$GroupLocation {
  const factory GroupLocation({
    required double x,
    required double y,
    required double centerX,
  }) = _GroupLocation;
}
