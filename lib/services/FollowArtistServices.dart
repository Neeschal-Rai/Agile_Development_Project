import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FollowArtistServices {
  Future<dynamic> followartist(body) async {
    try {
      var res = await http.post(Uri.parse(followArtist),
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
  Future<dynamic> getfollowingrtist(String id) async {
    try {
      var res = await http.get(Uri.parse(getallfollowArtist+id));
      return res.body;
    } catch (e) {
      print(e);
    }
  }

}
