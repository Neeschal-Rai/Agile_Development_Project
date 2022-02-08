import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/screens/updateprofilescreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateProfileServices {
  Future<dynamic> updateprofile(String id, String token, body) async {
    try {
      print(body["email"]);
      var request =
          http.MultipartRequest('PUT', Uri.parse(getUpdateProfile + id));

      print(body["username"]);
      request.fields['username'] = body["username"];
      request.fields['email'] = body["email"];
      request.files.add(
          await http.MultipartFile.fromPath('myimage', body["image"]!.path));

      var response = await request.send();
      final res = await http.Response.fromStream(response);
      return res.body;
    } catch (e) {
      print(e);
    }
  }
  Future<dynamic> updateprofilewithoutimage(String id, body) async {
    print("hello world");
    try {
      var res =
      await http.put(Uri.parse(getUpdateProfilewithoutImage+id),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "application/json"
          },
          body: json.encode(body));
      print(res.body);
      return res.body;
    }
    catch (e) {
      print(e);
    }
  }
}
