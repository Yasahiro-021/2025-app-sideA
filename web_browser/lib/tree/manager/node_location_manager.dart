import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/model/node_location.dart';

part 'node_location_manager.g.dart';

@riverpod
class NodeLocationManager extends _$NodeLocationManager {
  @override
  NodeLocation build(NodePath path) {
    return NodeLocation(depth: 0, index: 0);
  }
}
