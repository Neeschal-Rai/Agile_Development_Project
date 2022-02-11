import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadSongServices {
  Future<dynamic> uploadsong(body) async {
    try {
      print(body);
      var request =
      http.MultipartRequest('POST', Uri.parse(getUploadSong));
      request.fields['song_name'] = body["song_name"];
      request.fields['artist_name'] = body["artist_name"];
      request.fields['song_desc'] = body["song_desc"];

      request.files.add(
          await http.MultipartFile.fromPath('myfile', body["image"]!.path));
      request.files.add(
          await http.MultipartFile.fromPath('myfile', body["song"]!.path));
      request.files.add(
          await http.MultipartFile.fromPath('myfile', body["lyrics"]!.path));
        print(request.files);
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      return res.body;
    } catch (e) {
      print(e);
    }
  }
}
