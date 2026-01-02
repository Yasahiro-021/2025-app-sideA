import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/tree/view/tree_settings.dart';

part 'tree_settengs_provider.g.dart';
@riverpod
TreeSettings treeSettings(Ref ref) {
  return const TreeSettings();
}
