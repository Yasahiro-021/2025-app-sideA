import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//使用モデル
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';
//依存プロバイダ
import 'package:web_browser/tree/manager/element_location_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';
import 'package:web_browser/tree/model/element_location.dart';
import 'package:web_browser/tree/model/group_location.dart';
import 'package:web_browser/tree/view/tree_settengs_provider.dart';

part 'line_manager.g.dart';

///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する
@Riverpod(keepAlive: true)
class LineManager extends _$LineManager {
  @override
  (Offset, Offset) build(NodePath parentPath) {
    //子要素がいなければ線を引かない
    if (ref.watch(childrenAtPathMangerProvider(parentPath)).children.isEmpty) {
      return (Offset.zero, Offset.zero);
    }
    Offset start;
    Offset end;
    //エレメント側の位置を取得
    ElementLocation elementLocation = ref.watch(
      elementLocationManagerProvider(parentPath),
    );
    final double padding = ref.watch(treeSettingsProvider).elementPadding;
    start = Offset(elementLocation.centerX, elementLocation.bottomY - padding);
    //グループの位置を取得
    GroupLocation groupLocation = ref.watch(
      groupLocationManagerProvider(parentPath),
    );
    end = Offset(groupLocation.centerX, groupLocation.y);
    return (start, end);
  }
}
