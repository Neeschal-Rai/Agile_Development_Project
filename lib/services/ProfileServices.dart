import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  Future<dynamic> getUser(String id) async {
    try {
      var res = await http.get(Uri.parse(getUserProfile+id));
      
      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
