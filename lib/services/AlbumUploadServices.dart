import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadAlbumServices {
  Future<dynamic> uploadalbum(body) async {
    try {
      print(body['album_files'][0]);
      var request =
      http.MultipartRequest('POST', Uri.parse(albumupload));
      request.fields['album_name'] = body["album_name"];
      request.fields['album_desc'] = body["album_desc"];
      request.files.add(
          await http.MultipartFile.fromPath('myfile', body["image"]!.path));
      for( var i = 0 ; i < body["album_files"].length; i++ ) {
        request.files.add(
            await http.MultipartFile.fromPath('myfile', body["album_files"][i]!.path));
      }
      print(request.files);

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      return res.body;
    } catch (e) {
      print(e);
    }
  }
  Future<dynamic> getalbumdata() async {
    print("heelaoeg");
    try {
      print(getalbumdataurl);
      var res = await http.get(Uri.parse(getalbumdataurl));
      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getalbumsongdata(String id) async {
    print("heelaoeg");
    try {
      print(getalbumdataurl);
      var res = await http.get(Uri.parse(getalbumsongdataurl+id));
      return json.encode(res.body);
    } catch (e) {
      print(e);
    }
  }
}
