import 'package:dhun/constraints/constraints.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginServices {
  Future<dynamic> Login(body) async {
    try {
      var res = await http.post(Uri.parse(getLoginUrl),
          headers: {
            'Content-Type': 'application/json',
            "Accept": "application/json"
          },
          body: json.encode(body));
      return res.body;
    } catch (e) {
      print(e);
    }
  }
}
