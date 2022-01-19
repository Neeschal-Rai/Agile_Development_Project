import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadSongServices {
  Future <dynamic> uploadsong(body) async {
    try {
      var res =
      await http.post(Uri.parse(getUploadSong),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "application/json"
          },
          body: json.encode(body));
      return res.body;
    }
    catch (e) {
      print(e);
    }
  }
}