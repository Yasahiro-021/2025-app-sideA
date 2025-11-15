import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_path.freezed.dart';

@freezed
abstract class NodePath with _$NodePath {
  const factory NodePath({required List<int> path}) = NormalPath;

  const factory NodePath.root() = RootPath;
}


