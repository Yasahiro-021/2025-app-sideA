import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';

@freezed
///履歴を表すクラス
abstract class History with _$History {
  const factory History({
    required final String name,
    required final DateTime date,
  }) = _History;
}