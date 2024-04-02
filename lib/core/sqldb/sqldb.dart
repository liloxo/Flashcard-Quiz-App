import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'cards');
    Database mydb = await openDatabase(path, onCreate: _onCreate, version: 2);
    return mydb;
  }

/*_onUpgrade(Database db , int oldversion , int newversion ) {

 print("onUpgrade =====================================") ; 
}*/

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "cards" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "question" TEXT NOT NULL,
    "answerone" TEXT NOT NULL,
    "answertwo" TEXT NOT NULL,
    "answerthree" TEXT NOT NULL,
    "answerfour" TEXT NOT NULL,
    "rightanswer" TEXT NOT NULL
  )
 ''');
  }

  readData() async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query('cards');
    return response;
  }

  insertData(Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert('cards', values);
    return response;
  }

  updateData(Map<String, Object?> values, String mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.update('cards', values, where: mywhere);
    return response;
  }

  deleteData(String mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete('cards', where: mywhere);
    return response;
  }

  mydeletedb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'cards');
    await deleteDatabase(path);
  }
}
