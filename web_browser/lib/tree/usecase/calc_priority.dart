import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_browser/core/node/node_path.dart';

part 'calc_priority.g.dart';

///currentが
@riverpod
bool isCurrentPriorityHeigher(NodePath current, NodePath target){

  if(current.depth!= target.depth){
    throw StateError("depthが同一でなければ優先度は計算できません");
  }

  int currentDepth = 0;

  //ノードの深さまで繰り返し
  for(currentDepth; currentDepth < current.depth; currentDepth++){
    //繰り返す途中、互いのパスが異なれば抜け出す。
    if(current.path[currentDepth] != target.path[currentDepth]) break;
  }

  //第一引数のパスの方が大きいか。
  return (current.path[currentDepth] > target.path[currentDepth]);
}