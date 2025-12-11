/// データベース用のNodeモデルクラス
/// 
/// SQLiteのnodesテーブルに対応するデータ構造
class NodeModel {
  final int? id;
  final String name;
  final int? parentId;

  NodeModel({
    this.id,
    required this.name,
    this.parentId,
  });

  /// MapからNodeModelを生成（DB読み込み用）
  factory NodeModel.fromMap(Map<String, dynamic> map) {
    return NodeModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      parentId: map['parent_id'] as int?,
    );
  }

  /// NodeModelをMapに変換（DB書き込み用）
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'parent_id': parentId,
    };
  }

  /// コピーを作成（一部プロパティを変更可能）
  NodeModel copyWith({
    int? id,
    String? name,
    int? parentId,
  }) {
    return NodeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
    );
  }

  @override
  String toString() => 'NodeModel(id: $id, name: $name, parentId: $parentId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NodeModel &&
        other.id == id &&
        other.name == name &&
        other.parentId == parentId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ parentId.hashCode;
}
