import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../../util/tables_sqflite.dart';

class DBHelper {

  static late Database _db;
  static const _version = 1;

  Future<Database> get database async{
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path= join(documentDirectory.path,'database_local.db');
    Database dbCon= await openDatabase(path,version: _version,onCreate:  _onCreate);
    return dbCon;
  }

  void _onCreate(Database db, int version) async{
    await db.execute(tableActivity);
  }
}