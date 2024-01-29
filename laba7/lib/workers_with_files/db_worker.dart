import 'package:laba7/messenger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBWorker{
  late final database;
  DBWorker(){
    database = openDB();
  }
  Future<void> insert(int id, String username, String message) async {
// Get a reference to the database.
    final Database db = await database;
    await db.insert(
      'messenger',
      {'id': id, 'username': username, 'message': message},
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }
  Future<void> update(int id, String username, String message) async {
// Get a reference to the database.
    final Database db = await database;
    await db.update(
        'messenger',
        {'id': id, 'username': username, 'message': message},
        where: 'id = ?',
        whereArgs: [id]
    );
  }
  Future<void> delete(int id) async {
// Get a reference to the database.
    final Database db = await database;
    await db.delete(
        'messenger',
        where: 'id = ?',
        whereArgs: [id]
    );
  }
  Future<List<(int,String,String)>> get() async {
// Get a reference to the database.
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
        'messenger'
    );
    return List<(int,String,String)>.generate(maps.length, (i) {
      return (
        maps[i]['id'],
        maps[i]['username'],
        maps[i]['message'],
      );
    });
  }
  Future<Database> openDB()async{
    return await openDatabase(
        join(await getDatabasesPath(), 'messenger.db'),
        onCreate: (db, version){
          return db.execute(
            "CREATE TABLE messenger(id INTEGER PRIMARY KEY, username TEXT, message TEXT)",
          );
        },
        version: 1
    );
  }
}