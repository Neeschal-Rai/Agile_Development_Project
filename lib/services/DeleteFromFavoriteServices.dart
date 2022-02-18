import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteFromFavoriteServices {
  Future<dynamic> deletefavorites(String id) async {
    try {
      var res = await http.delete(Uri.parse(deleteFavorites+id));

      return res.body;
    } catch (e) {
      print(e);
    }
  }
}
