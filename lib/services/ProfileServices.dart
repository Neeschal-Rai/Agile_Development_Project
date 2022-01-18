import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  Future<dynamic> getUser() async {
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    final String user_id = userprefs.getString("userid");
    try {
      var res = await http.get(Uri.parse(getUserProfile+"61e6adfe29ff7fa5e8c43cb1"));
      
      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
