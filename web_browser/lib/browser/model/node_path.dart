import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_path.freezed.dart';

/// ツリー上のノード位置を示すパスを表現するモデル（Freezed/Union）。
///
/// - `NormalPath` は親を持つ通常のパスを保持します。
/// - `RootPath` は親を持たないルートを表します。
@freezed
class NodePath with _$NodePath {
  /// 内部コンストラクタ
  NodePath._internal(this.path);

  /// 通常のファクトリ。Rootの作成時は空白のリストを渡す。
  factory NodePath({required List<int> path}){
    // パスの各要素が0以上であることを検証
    for (final index in path) {
      if (index < 0) {
        throw const FormatException('Path indices must be non-negative');
      }
    }
    return NodePath._internal(path);
  }

  @override
  final List<int> path;

  // ↓↓↓↓↓共用のメンバ↓↓↓↓↓↓↓↓↓
  // ↓↓↓↓↓片方のみに実装のメンバは最下部にエクステンションとして実装↓↓↓↓↓↓↓↓

  /// 指定のインデックスで子パスを作成する。
  NodePath createChildPath(int index) => switch (this) {
    NodePath(path: final p) => NodePath(path: [...p, index])
  };

  /// パスの深さを返す（要素数）。`RootPath` は 0。
  int get depth => switch (this) {
    NodePath(path: final p) => p.length,
  };

  ///　受け取ったパスが親かどうか（this が親か）。
  bool isParentOf(NodePath other) => other.isChildOf(this);

  /// パスを `/1/2` 形式の文字列で返す。`RootPath` は`/`を返す。
  @override
  String toString() => (path.isEmpty)
      ? '/'
      : '/${path.map((e) => e.toString()).join('/')}';

  /// 文字列（例: "/1/2/3"）から `NodePath` を復元。
  ///
  /// - `null`または空文字は`FormatException`が発生。
  factory NodePath.fromString(String? value) {
    if (value == null || value.isEmpty) {
      throw const FormatException('Invalid path string');
    }

    // ルートパスの場合はルートパスを返す。
    if (value == '/') return NodePath(path: []);

    // 先頭のスラッシュを除去して分割、整数に変換
    assert(value.startsWith('/'), 'Path string must start with a "/" value: $value');
    final parts = value.substring(1).split('/');
    assert(parts.every((part) => int.tryParse(part) != null), 'All parts must be integers in path string: $value');
    final ints = parts.map(int.parse).toList();

    //生成して返す
    return NodePath(path: ints);
  }

  /// 親パスを返す。
  NodePath get parentPath {
    if(path.length  <= 1){
      return NodePath(path: []);
      } else {
      return NodePath(path: path.sublist(0, path.length - 1));
      }
  }

  ///  入力されたパスが親かどうか（this が子か）。
  bool isChildOf(NodePath other) => (parentPath == other) ? true : false;
}
