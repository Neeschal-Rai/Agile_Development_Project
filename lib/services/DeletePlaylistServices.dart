import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeletePlaylistServices {
  Future<dynamic> deleteplaylist(String playlistid) async {
    try {
      var res = await http.delete(Uri.parse(deletePlaylist+playlistid));
      return res.body;
    } catch (e) {
      print(e);
    }
  }
}
