import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// データベース接続・初期化を管理するヘルパークラス
/// 
/// シングルトンパターンを使用して、アプリ全体で1つのインスタンスを共有
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // データベースのバージョン（スキーマ変更時にインクリメント）
  static const int _databaseVersion = 2;
  static const String _databaseName = 'web_browser.db';

  // テーブル名
  static const String tableTrees = 'trees';
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
    // treesテーブルの作成（複数ツリー管理用）
    await db.execute('''
      CREATE TABLE $tableTrees (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL UNIQUE,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    // nodesテーブルの作成
    // pathはNodePathの文字列表現（例: "/0/1/2"）
    // tree_idで所属するツリーを指定
    await db.execute('''
      CREATE TABLE $tableNodes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tree_id INTEGER NOT NULL,
        path TEXT NOT NULL,
        title TEXT NOT NULL,
        url TEXT NOT NULL,
        date TEXT,
        FOREIGN KEY (tree_id) REFERENCES $tableTrees (id) ON DELETE CASCADE,
        UNIQUE (tree_id, path)
      )
    ''');
    // ツリーIDとパスによる検索を高速化するインデックス
    await db.execute('CREATE INDEX idx_nodes_tree_path ON $tableNodes (tree_id, path)');
  }

  /// データベースアップグレード時のコールバック
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // バージョン1から2へのマイグレーション
    if (oldVersion < 2) {
      // treesテーブルの作成
      await db.execute('''
        CREATE TABLE $tableTrees (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL UNIQUE,
          created_at TEXT,
          updated_at TEXT
        )
      ''');

      // デフォルトツリーを作成
      final now = DateTime.now().toIso8601String();
      await db.insert(tableTrees, {
        'name': 'Default',
        'created_at': now,
        'updated_at': now,
      });

      // nodesテーブルの再構築（tree_id追加）
      await db.execute('ALTER TABLE $tableNodes RENAME TO nodes_old');
      await db.execute('''
        CREATE TABLE $tableNodes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          tree_id INTEGER NOT NULL,
          path TEXT NOT NULL,
          title TEXT NOT NULL,
          url TEXT NOT NULL,
          date TEXT,
          FOREIGN KEY (tree_id) REFERENCES $tableTrees (id) ON DELETE CASCADE,
          UNIQUE (tree_id, path)
        )
      ''');
      // 既存ノードをデフォルトツリー(id=1)に移行
      await db.execute('''
        INSERT INTO $tableNodes (tree_id, path, title, url, date)
        SELECT 1, path, title, url, date FROM nodes_old
      ''');
      await db.execute('DROP TABLE nodes_old');
      await db.execute('DROP INDEX IF EXISTS idx_nodes_path');
      await db.execute('CREATE INDEX idx_nodes_tree_path ON $tableNodes (tree_id, path)');
    }
  }

  /// データベースを閉じる
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
