import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchSongsServices {
  Future <dynamic> searchsongs() async {
    try {
      var res =
      await http.get(Uri.parse(searchsongfromApi));
      return json.encode(res.body);
    }
    catch (e) {
      print(e);
    }
  }
}