/// データベース用のTreeモデルクラス
/// 
/// SQLiteのtreesテーブルに対応するデータ構造
/// 複数のツリーを管理するためのメタ情報を保持
class TreeModel {
  final int? id;
  final String name;        // ツリー名
  final String? createdAt;  // 作成日時
  final String? updatedAt;  // 更新日時

  TreeModel({
    this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  /// MapからTreeModelを生成（DB読み込み用）
  factory TreeModel.fromMap(Map<String, dynamic> map) {
    return TreeModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      createdAt: map['created_at'] as String?,
      updatedAt: map['updated_at'] as String?,
    );
  }

  /// TreeModelをMapに変換（DB書き込み用）
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  /// コピーを作成（一部プロパティを変更可能）
  TreeModel copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) {
    return TreeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() => 'TreeModel(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TreeModel &&
        other.id == id &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
