import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetFavoriteServices {
  Future<dynamic> getfavorites(String userid) async {
    try {
      var res = await http.get(Uri.parse(getFavorites+userid));

      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
