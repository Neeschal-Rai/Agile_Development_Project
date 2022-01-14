import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserServices {
  Future <dynamic> Register(body) async {
    try {
      var res =
      await http.post(Uri.parse(getRegisterUrl),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "application/json"
          },
          body: json.encode(body));
      return res.body;
    }
    catch (e) {
      print(e);
    }



  }
}