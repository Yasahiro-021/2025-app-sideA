
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'element.freezed.dart';
@freezed
abstract class Element with _$Element {
  const factory Element({
  required NodePath path,
  }) = _Element;
}