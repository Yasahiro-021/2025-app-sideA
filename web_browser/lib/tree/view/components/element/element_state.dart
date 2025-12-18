import 'package:freezed_annotation/freezed_annotation.dart';

part 'element_state.freezed.dart';

@freezed
abstract class ElementState with _$ElementState {
  const factory ElementState({
    required String title,
    required (double, double) position,
  }) = _ElementState;
}
