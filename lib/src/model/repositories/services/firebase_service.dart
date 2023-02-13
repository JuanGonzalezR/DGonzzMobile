// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../entities/ent_activity.dart';

class FirebaseService {

  final String _url = "app-proyect-d5e7f-default-rtdb.firebaseio.com";

  Future<bool> createActivity(EntExportActivity activity) async {
    var url = Uri.https(_url, '/activities.json');

    final response = await http.post(url, body: entExportActivityToJson(activity));
    final decodeData = json.decode(response.body);

    print(decodeData);

    return true;
  }
}