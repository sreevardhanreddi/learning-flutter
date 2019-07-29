import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:movies_app/models/movie_model.dart';

final TableName = 'MoviesApp';

class MoviesDB {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'movies.db'),
        onCreate: (db, version) {
      return db.execute('''CREATE TABLE MoviesApp(id TEXT PRIMARY KEY,
          title TEXT, posterPath TEXT,
          overview TEXT,
          releaseDate TEXT,
          voteAverage TEXT,
          isFavourite TEXT)''');
    }, version: 1);
  }

  static Future<void> insert(Map<String, Object> data) async {
    final db = await MoviesDB.database();
    db.insert(
      TableName, // table heres is table name, passed as argument
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Movie>> getFavouriteMovies() async {
    final db = await MoviesDB.database();
    final movies = await db.query(TableName);
    print('------- movies after query ----------');
    print(movies);
    List<Movie> data = [];
    for (int i = 0; i < movies.length; i++) {
      data.add(Movie.fromJson(movies[i]));
      print('adding movies');
      print(movies[i]);
    }
    return data;
  }

  static Future<bool> isFavourite(String id) async {
    final db = await MoviesDB.database();
    try {
      var result = await db
          .rawQuery('SELECT isFavourite FROM ${TableName} where id=${id}');
      if (result.length == 1) {
        print('query result >>>>>>>>>>>>>>>');
        print(result[0]['isFavourite'] == '1');
        print(result);
        if (result[0]['isFavourite'] == '1') {
          return true;
        } else {
          return false;
        }
      } else if (result.length == 0) {
        return false;
      } else {
        return false;
      }
    } catch (e) {
      print('query result >>>>>>>>>>>>>>>');
      print(e);
      throw 'could not perform the query';
      // return false;
    }
  }

  static Future<void> delete(String id) async {
    final db = await MoviesDB.database();
    try {
      var result =
          await db.delete(TableName, where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      print('query result >>>>>>>>>>>>>>>');
      print(e);
      throw 'could not perform the query';
      // return false;
    }
  }
}
