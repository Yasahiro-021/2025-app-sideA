import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//使用モデル
import 'package:web_browser/core/node/node_path.dart';
//依存プロバイダ
import 'package:web_browser/tree/manager/element_location_manager.dart';
import 'package:web_browser/tree/manager/group_location_manager.dart';

part 'line_manager.g.dart';

///同一のパスを持つエレメントとグループを結ぶLineWidgetのOffsetを管理する
@riverpod
class LineManager extends _$LineManager {
  @override
  (Offset, Offset) build(NodePath parentPath) {
    Offset start;
    Offset end;
    //エレメント側の位置を取得
    (double, double) elementLocation = ref.watch(
      elementLocationManagerProvider(parentPath),
    );
    start = Offset(elementLocation.$1, elementLocation.$2);
    //グループの位置を取得
    (double, double) groupLocation = ref.watch(
      groupLocationManagerProvider(parentPath),
    );
    end = Offset(groupLocation.$1, groupLocation.$2);
    return (start, end);
  }
}
