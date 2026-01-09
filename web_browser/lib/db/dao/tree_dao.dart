import 'package:sqflite/sqflite.dart';
import '../database_helper.dart';
import '../models/tree_model.dart';

/// TreeのCRUD操作を行うData Access Objectクラス
class TreeDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  /// ツリーを挿入
  Future<int> insert(TreeModel tree) async {
    final db = await _databaseHelper.database;
    final now = DateTime.now().toIso8601String();
    final treeWithTimestamp = tree.copyWith(
      createdAt: tree.createdAt ?? now,
      updatedAt: now,
    );
    return await db.insert(
      DatabaseHelper.tableTrees,
      treeWithTimestamp.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// IDでツリーを取得
  Future<TreeModel?> getById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }

  /// 名前でツリーを取得
  Future<TreeModel?> getByName(String name) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      where: 'name = ?',
      whereArgs: [name],
    );
    if (maps.isEmpty) return null;
    return TreeModel.fromMap(maps.first);
  }

  //TODO あいまい検索の実装

  /// 全ツリーを取得
  Future<List<TreeModel>> getAll() async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      DatabaseHelper.tableTrees,
      orderBy: 'updated_at DESC',
    );
    return maps.map((map) => TreeModel.fromMap(map)).toList();
  }

  /// ツリーを更新
  Future<int> update(TreeModel tree) async {
    if (tree.id == null) {
      throw ArgumentError('更新するツリーにはIDが必要です');
    }
    final db = await _databaseHelper.database;
    final now = DateTime.now().toIso8601String();
    final treeWithTimestamp = tree.copyWith(updatedAt: now);
    return await db.update(
      DatabaseHelper.tableTrees,
      treeWithTimestamp.toMap(),
      where: 'id = ?',
      whereArgs: [tree.id],
    );
  }

  /// ツリーの更新日時を更新
  Future<void> touch(int treeId) async {
    final db = await _databaseHelper.database;
    final now = DateTime.now().toIso8601String();
    await db.update(
      DatabaseHelper.tableTrees,
      {'updated_at': now},
      where: 'id = ?',
      whereArgs: [treeId],
    );
  }

  /// ツリーを削除（関連するノードも連鎖削除）
  Future<int> delete(int id) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      DatabaseHelper.tableTrees,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 全ツリーを削除
  Future<int> deleteAll() async {
    final db = await _databaseHelper.database;
    return await db.delete(DatabaseHelper.tableTrees);
  }
}
