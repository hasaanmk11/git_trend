import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await init();
    return _db!;
  }

  static Future<Database> init() async {
    final path = join(await getDatabasesPath(), "repos.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE repos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            stars INTEGER,
            username TEXT,
            avatarUrl TEXT
          )
        ''');
      },
    );
  }
}
