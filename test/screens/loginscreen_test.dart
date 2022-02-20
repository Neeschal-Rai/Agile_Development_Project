import 'dart:convert';
import 'package:dhun/Services/LoginServices.dart';
import 'package:dhun/Services/RegisterServices.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test("User Login", () async {
    bool expected = true;

    var userServices = LoginServices();
    var body = {
      "email": "raibidhan280@gmail.com",
      "usertype":"User",
      "password": "abcdefghr",

    };
    var response = await userServices.Login(body);
    var resBody = json.decode(response.toString());
    bool received = resBody["success"];
    expect(expected, received);
  });
}