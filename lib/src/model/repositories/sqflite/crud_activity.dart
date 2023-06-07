import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
import '../../entities/ent_activity.dart';

class EntActivityCRUD {
  final dbase = DBHelper();

  Future<void> insertActivity(EntExportActivity entActivity) async {
    final Database db = await dbase.database;
    //final activities = await db.query('activity');

    /*if (activities.isNotEmpty) {
      await db.execute("DELETE from 'activity'");
      await db.execute(
          "UPDATE SQLITE_SEQUENCE SET seq = 0 WHERE name = 'activity'");
    }*/

    await db.insert('activity', entActivity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

    Future<void> deleteAllActivity() async {
    final Database db = await dbase.database;
    final activities = await db.query('activity');

    if (activities.isNotEmpty) {
      await db.execute("DELETE from 'activity'");
      await db.execute(
          "UPDATE SQLITE_SEQUENCE SET seq = 0 WHERE name = 'activity'");
    }
  }

  Future<int> countActivities() async {
    final Database db = await dbase.database;
    final List<Map<String, dynamic>> act = await db.query('activity');

    return act.length;
  }

  Future<List<EntExportActivity>> loadActivities() async {
    final Database db = await dbase.database;
    final List<Map<String, dynamic>> act = await db.query('activity');

    if (act.isNotEmpty) {
      return List.generate(act.length, (i) {
        return EntExportActivity(
          actName: act[i]['act_name'],
          actDescription: act[i]['act_description'],
          actStatus: act[i]['act_status'],
        );
      });
    } else {
      throw Exception("Not found");
    }
  }


}
