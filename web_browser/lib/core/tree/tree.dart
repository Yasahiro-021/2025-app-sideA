import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/core/tree/tree_id.dart';
import 'package:web_browser/core/tree/tree_name.dart';

part 'tree.freezed.dart';

@freezed
abstract class Tree with _$Tree {
  const factory Tree({required TreeId id, required TreeName name}) = _Tree;
}
