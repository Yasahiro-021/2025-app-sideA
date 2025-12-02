import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';
import 'package:web_browser/core/usecase/children_at_path_manager.dart';

part 'compare_priority_usecase.g.dart';

///currentとtargetの優先度を比較し、compareTo形式で結果を返す。
///
///同一階層でない場合はStateErrorが発生。
///
///優先度：パスが別れる層において、中央によっている方が優先度が高い。
///
///[0,0,1,2]と[0,0,2,1]を比較した場合、最初に異なるのは3層目であり、この層でより中央に近い方
///（兄弟ノードの数で変わる）が優先度が高い。もし同じ優先度であれば、次の層で同様に比較を行う。
///
///戻り値：currentの優先度が高い場合は1、低い場合は-1、同値の場合は0を返す。
@riverpod
class ComparePriorityUsecase extends _$ComparePriorityUsecase {
  @override
  int build(NodePath path, NodePath compareTo) {
    if (path.depth != compareTo.depth) {
      throw StateError("depthが同一でなければ優先度は計算できません");
    }
    if (path == compareTo) {
      //同じパスの場合、優先度は同じため0を返す。
      return 0;
    }
    if (path.depth == 0) {
      //ルートノード場合、1つしか存在せず必然的に優先度は同じため0を返す。
      return 0;
    }

    int currentDepth = 1;

    //ノードの深さまで繰り返し
    for (currentDepth; currentDepth < path.depth + 1; currentDepth++) {
      //現在の深さでノードを作成し、親ノードを取得
      NodePath? currentPath = NodePath(
        path: path.path.sublist(0, currentDepth), //0からcurrentDepthまで
      ); //ルートノードは除外済みのため非null。
      NodePath? targetPath = NodePath(
        path: compareTo.path.sublist(0, currentDepth),
      );
      double currentDistance = _checkInBrother(currentPath);
      double targetDistance = _checkInBrother(targetPath);
      if (currentDistance < targetDistance) {
        //currentの方が中央に近い場合、優先度が高いため1を返す。
        return 1;
      } else if (currentDistance > targetDistance) {
        //targetの方が中央に近い場合、優先度が低いため-1を返す。
        return -1;
      }

      //同値の場合、次の階層で比較を続行。
    }
    return 0; //すべての階層で同値の場合、優先度は同じため0を返す。
  }

  ///兄弟ノード内での優先度を計算し、中央からの距離を返す。ルートPathエラー。
  double _checkInBrother(NodePath path) {
    NodePath parentPath = path.parentPath!;
    
    List<NodePath> brothers = ref
        .read(childrenAtPathMangerProvider(parentPath))
        .children;

    int count = brothers.length;

    //中央のインデックスを計算。
    double center = (count - 1) / 2;

    //中央からのcurrentとtargetの距離を計算。
    double distance = (path.path[path.depth - 1] - center).abs();

    return distance;
  }
}
