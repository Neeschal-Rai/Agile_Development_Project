import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetAllArtistDataServices {
  Future<dynamic> getartists() async {
    try {
      var res = await http.get(Uri.parse(getArtistShowall));

      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getartistsfromid(artistid) async {
    try {
      var res = await http.get(Uri.parse(getfollowArtistfromid+artistid));

      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
