import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../models/node_model.dart';

/// NodeのCRUD操作を行うData Access Objectクラス
class NodeDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  /// ノードを挿入（同じツリー内で同じパスが存在する場合は上書き）
  Future<int> insert(NodeModel node) async {
    final db = await _databaseHelper.database;
    return await db.insert(
      DatabaseHelper.tableNodes,
      node.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 複数のノードを一括挿入
  Future<void> insertAll(List<NodeModel> nodes) async {
    final db = await _databaseHelper.database;
    final batch = db.batch();
    for (final node in nodes) {
      batch.insert(
        DatabaseHelper.tableNodes,
        node.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  /// ツリーIDとパスでノードを取得
  Future<NodeModel?> getByPath(int treeId, String path) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, path],
    );
    if (maps.isEmpty) return null;
    return NodeModel.fromMap(maps.first);
  }

  /// 指定ツリーの全ノードを取得
  Future<List<NodeModel>> getAllByTreeId(int treeId) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  /// 全ノードを取得（全ツリー）
  Future<List<NodeModel>> getAll() async {
    final db = await _databaseHelper.database;
    final maps = await db.query(DatabaseHelper.tableNodes);
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  /// ルートノード（パスが"/"）を取得
  Future<NodeModel?> getRootNode(int treeId) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, '/'],
    );
    if (maps.isEmpty) return null;
    return NodeModel.fromMap(maps.first);
  }

  /// 指定したパスの直接の子ノードを取得
  /// 
  /// 例: parentPath="/0" の場合、"/0/0", "/0/1"などを取得
  Future<List<NodeModel>> getChildrenByParentPath(int treeId, String parentPath) async {
    final db = await _databaseHelper.database;
    // 親パスの直接の子のみを取得するパターン
    // 例: parentPath="/" -> "/0", "/1" など（/数字 の形式）
    // 例: parentPath="/0" -> "/0/0", "/0/1" など
    String pattern;
    if (parentPath == '/') {
      pattern = '/[0-9]+';
    } else {
      pattern = '$parentPath/[0-9]+';
    }
    
    final maps = await db.rawQuery(
      'SELECT * FROM ${DatabaseHelper.tableNodes} WHERE tree_id = ? AND path REGEXP ?',
      [treeId, '^$pattern\$'],
    );
    
    // SQLiteのREGEXPがサポートされていない場合のフォールバック
    if (maps.isEmpty) {
      final allMaps = await db.query(
        DatabaseHelper.tableNodes,
        where: 'tree_id = ?',
        whereArgs: [treeId],
      );
      final regex = RegExp('^$pattern\$');
      return allMaps
          .where((map) => regex.hasMatch(map['path'] as String))
          .map((map) => NodeModel.fromMap(map))
          .toList();
    }
    
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  /// パスの前方一致で子孫ノードを全て取得
  /// 
  /// 例: parentPath="/0" の場合、"/0/0", "/0/1", "/0/0/0"なども含む
  Future<List<NodeModel>> getDescendantsByPath(int treeId, String parentPath) async {
    final db = await _databaseHelper.database;
    String likePattern;
    if (parentPath == '/') {
      likePattern = '/%';
    } else {
      likePattern = '$parentPath/%';
    }
    
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path LIKE ?',
      whereArgs: [treeId, likePattern],
    );
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  /// ツリーIDとパスでノードを更新
  Future<int> updateByPath(int treeId, NodeModel node) async {
    final db = await _databaseHelper.database;
    return await db.update(
      DatabaseHelper.tableNodes,
      node.toMap(),
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, node.path],
    );
  }

  /// ツリーIDとパスでノードを削除
  Future<int> deleteByPath(int treeId, String path) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND path = ?',
      whereArgs: [treeId, path],
    );
  }

  /// 指定パスとその子孫を全て削除
  Future<int> deleteWithDescendants(int treeId, String path) async {
    final db = await _databaseHelper.database;
    if (path == '/') {
      // ルートの場合はツリー内の全ノード削除
      return await db.delete(
        DatabaseHelper.tableNodes,
        where: 'tree_id = ?',
        whereArgs: [treeId],
      );
    }
    // 自身と子孫を削除
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ? AND (path = ? OR path LIKE ?)',
      whereArgs: [treeId, path, '$path/%'],
    );
  }

  /// 指定ツリーの全ノードを削除
  Future<int> deleteAllByTreeId(int treeId) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'tree_id = ?',
      whereArgs: [treeId],
    );
  }

  /// 全ノードを削除（全ツリー）
  Future<int> deleteAll() async {
    final db = await _databaseHelper.database;
    return await db.delete(DatabaseHelper.tableNodes);
  }
}
