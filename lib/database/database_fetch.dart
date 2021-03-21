import 'package:challenge/shared/models/avatar_model.dart';
import 'package:challenge/shared/models/emoji_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "challenge.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    print('PATH DB>>> $path');
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE emojis ( id INTEGER, name VARCHAR, url VARCHAR)');
    await db.execute(
        'CREATE TABLE avatars ( id INTEGER, login VARCHAR, avatar_url VARCHAR, name VARCHAR)');
  }

  Future<void> insert({Emoji emoji, Avatar avatar, String table}) async {
    Database db = await instance.database;
    if (avatar != null) {
      await db.insert(table, avatar.toJson());
    } else {
      await db.insert(table, emoji.toJson());
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows({String table}) async {
    Database db = await instance.database;
    var res = await db.query(table, orderBy: "id");
    return res;
  }

  Future<List<Map<String, dynamic>>> selectRecord(
      {String table, int id}) async {
    Database db = await instance.database;
    var res = await db.query('$table where id=$id');
    return res;
  }

  Future<List<Map<String, dynamic>>> selectLogin(
      {String table, String login}) async {
    Database db = await instance.database;
    var res = await db.query('$table where login="$login"');
    return res;
  }

  Future<int> delete({int id, String table}) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearTable({String table}) async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE FROM $table");
  }
}
