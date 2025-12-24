import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'tree_map_state.freezed.dart';

@freezed
abstract class TreeMapState with _$TreeMapState {
  const factory TreeMapState({required Iterable<NodePath> allPaths}) =
      _TreeMapState;
}
