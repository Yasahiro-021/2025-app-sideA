import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../models/node_model.dart';

/// NodeのCRUD操作を行うData Access Objectクラス
class NodeDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  /// ノードを挿入
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

  /// IDでノードを取得
  Future<NodeModel?> getById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return NodeModel.fromMap(maps.first);
  }

  /// 全ノードを取得
  Future<List<NodeModel>> getAll() async {
    final db = await _databaseHelper.database;
    final maps = await db.query(DatabaseHelper.tableNodes);
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  /// ルートノード（親がないノード）を取得
  Future<List<NodeModel>> getRootNodes() async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'parent_id IS NULL',
    );
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  /// 指定した親IDを持つ子ノードを取得
  Future<List<NodeModel>> getChildrenByParentId(int parentId) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableNodes,
      where: 'parent_id = ?',
      whereArgs: [parentId],
    );
    return maps.map((map) => NodeModel.fromMap(map)).toList();
  }

  /// ノードを更新
  Future<int> update(NodeModel node) async {
    if (node.id == null) {
      throw ArgumentError('更新するノードにはIDが必要です');
    }
    final db = await _databaseHelper.database;
    return await db.update(
      DatabaseHelper.tableNodes,
      node.toMap(),
      where: 'id = ?',
      whereArgs: [node.id],
    );
  }

  /// ノードを削除
  Future<int> delete(int id) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      DatabaseHelper.tableNodes,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 全ノードを削除
  Future<int> deleteAll() async {
    final db = await _databaseHelper.database;
    return await db.delete(DatabaseHelper.tableNodes);
  }
}
