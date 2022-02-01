import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetSongServices {
  Future<dynamic> getsongs() async {
    try {
      var res = await http.get(Uri.parse(getSongsServer));
      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
