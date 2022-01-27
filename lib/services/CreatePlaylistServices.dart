import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreatePlaylistServices {
  Future<dynamic> createplaylist(body) async {
    try {
      var res = await http.post(Uri.parse(getCreatePlaylist),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "application/json"
          },
          body: json.encode(body));
      return res.body;
    } catch (e) {
      print(e);
    }
  }
}
