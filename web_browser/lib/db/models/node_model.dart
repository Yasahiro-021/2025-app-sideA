/// データベース用のNodeモデルクラス
/// 
/// SQLiteのnodesテーブルに対応するデータ構造
/// NodePathをキーとしてBrowserNodeのデータを保存
/// tree_idで所属するツリーを識別
class NodeModel {
  final int? id;
  final int treeId;        // 所属するツリーのID
  final String path;       // NodePathの文字列表現（例: "/0/1/2"）
  final String title;      // BrowserNodeのtitle
  final String url;        // BrowserNodeのurl
  final String? date;      // BrowserNodeのdate

  NodeModel({
    this.id,
    required this.treeId,
    required this.path,
    required this.title,
    required this.url,
    this.date,
  });

  /// MapからNodeModelを生成（DB読み込み用）
  factory NodeModel.fromMap(Map<String, dynamic> map) {
    return NodeModel(
      id: map['id'] as int?,
      treeId: map['tree_id'] as int,
      path: map['path'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
      date: map['date'] as String?,
    );
  }

  /// NodeModelをMapに変換（DB書き込み用）
  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'tree_id': treeId,
      'path': path,
      'title': title,
      'url': url,
      'date': date,
    };
  }

  /// コピーを作成（一部プロパティを変更可能）
  NodeModel copyWith({
    int? id,
    int? treeId,
    String? path,
    String? title,
    String? url,
    String? date,
  }) {
    return NodeModel(
      id: id ?? this.id,
      treeId: treeId ?? this.treeId,
      path: path ?? this.path,
      title: title ?? this.title,
      url: url ?? this.url,
      date: date ?? this.date,
    );
  }

  @override
  String toString() => 'NodeModel(id: $id, treeId: $treeId, path: $path, title: $title, url: $url, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NodeModel &&
        other.id == id &&
        other.treeId == treeId &&
        other.path == path &&
        other.title == title &&
        other.url == url &&
        other.date == date;
  }

  @override
  int get hashCode => id.hashCode ^ treeId.hashCode ^ path.hashCode ^ title.hashCode ^ url.hashCode ^ date.hashCode;
}
