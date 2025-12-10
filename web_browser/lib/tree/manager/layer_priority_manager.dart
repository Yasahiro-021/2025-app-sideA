import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/tree/model/node_group.dart';
// import 'package:web_browser/tree/usecase/compare_priority_usecase.dart';

part 'layer_priority_manager.g.dart';

///同一レイヤー(同一depth)のGroupを管理する
@Riverpod(keepAlive: true)
class LayerPriorityManager extends _$LayerPriorityManager {
  @override
  List<NodeGroup> build(int depth) {
    return [];
  }

  ///追加
  void add(NodeGroup group) {
    state = [...state, group];
  }

  ///削除
  void remove(NodeGroup group) {
    state = state.where((e) => e != group).toList();
  }

  

  //グループを優先度順に並び替え。
  // void _sortByPriority() {
  //   List<NodeGroup> temp = state;
  //   temp.sort(((a, b) {
  //     //親同士のパスを比較。
  //     return ref.read(comparePriorityUsecaseProvider(a.parentPath, b.parentPath));
  //   }));
  // }
}
