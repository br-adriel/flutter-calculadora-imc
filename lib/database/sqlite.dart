import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

Map<int, String> scripts = {
  1: '''CREATE TABLE imc (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      altura REAL,
      peso REAL
    );''',
};

class SQLiteDatabase {
  static Database? db;

  Future<Database> obterBancoDeDados() async {
    db ??= await iniciarBancoDeDados();
    return db!;
  }

  Future iniciarBancoDeDados() async {
    db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (db, version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }
}
