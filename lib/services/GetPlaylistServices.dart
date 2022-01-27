import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetPlaylistServices {
  Future<dynamic> getallplaylist() async {
    try {
      var res = await http.get(Uri.parse(getPlaylistShowall));

      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
