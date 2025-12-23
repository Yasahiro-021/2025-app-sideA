import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/browser_node_from_path_notifier.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/tree/manager/element_location_manager.dart';
import 'package:web_browser/tree/view/components/element/element_state.dart';

part 'element_view_model.g.dart';

@riverpod
class ElementViewModel extends _$ElementViewModel {
  @override
  ElementState build(NodePath nodePath) {
    String title = ref.watch(browserNodeFromPathProvider(nodePath)).title;
    (double, double) position = ref.watch(
      elementLocationManagerProvider(nodePath),
    );
    return ElementState(title: title, position: position);
  }
}
