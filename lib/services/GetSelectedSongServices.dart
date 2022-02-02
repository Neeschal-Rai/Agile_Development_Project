import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetSelectedSongServices {
  Future<dynamic> getsong(String id) async {
    try {
      var res = await http.get(Uri.parse(getSelectedSongServer+id));
      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
