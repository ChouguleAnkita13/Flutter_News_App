import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;

Future getDatabase() async {
  database = openDatabase(
    join(await getDatabasesPath(), "bookmarkedDB.db"),
    version: 1,
    onCreate: (db, version) {
      return db.execute('''Create table BMNews(
    imgUrl Text,
    title Text,
    author Text,date Text
    )
    ''');
    },
  );
}
