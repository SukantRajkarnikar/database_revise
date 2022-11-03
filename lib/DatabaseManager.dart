import 'package:path/path.dart';
import 'package:database_revise/Post.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static DatabaseManager? _databaseManager;

  static DatabaseManager getDatabaseManager() {
    _databaseManager ??= DatabaseManager();
    return _databaseManager!;
  }

  Future<Database> getDbInstance() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'posts.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE postTable( id INTEGER PRIMARY KEY, userId INTEGER, title STRING, body STRING)');
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertPost(Post postObj) async {
    final db = await getDbInstance();
    await db.insert(
      'postTable',
      postObj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Post>> dbGetPost() async {
    final db = await getDbInstance();
    final List<Map<String, dynamic>> postList = await db.query('postTable');
    return List.generate(postList.length, (index) {
      return Post(
          id: postList[index]['id'],
          userId: postList[index]['userId'],
          title: postList[index]['title'],
          body: postList[index]['body']);
    });
  }
}
