import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// データベース接続・初期化を管理するヘルパークラス
/// 
/// シングルトンパターンを使用して、アプリ全体で1つのインスタンスを共有
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // データベースのバージョン（スキーマ変更時にインクリメント）
  static const int _databaseVersion = 1;
  static const String _databaseName = 'web_browser.db';

  // テーブル名
  static const String tableNodes = 'nodes';

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  /// データベースインスタンスを取得
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// データベースを初期化
  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// データベース作成時のコールバック
  Future<void> _onCreate(Database db, int version) async {
    // nodesテーブルの作成
    await db.execute('''
      CREATE TABLE $tableNodes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        parent_id INTEGER,
        FOREIGN KEY (parent_id) REFERENCES $tableNodes (id) ON DELETE CASCADE
      )
    ''');
  }

  /// データベースアップグレード時のコールバック
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // TODO: バージョンアップ時のマイグレーション処理を実装
  }

  /// データベースを閉じる
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
