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
      // request.headers['Authorization'] ='bearer $token';
      print(body["username"]);
      request.fields['username'] = body["username"];
      request.fields['email'] = body["email"];
      request.files.add(
          await http.MultipartFile.fromPath('myimage', body["image"]!.path));

      var response = await request.send();

      final res = await http.Response.fromStream(response);
      print(res.body);
    } catch (e) {
      print(e);
    }
  }
}
