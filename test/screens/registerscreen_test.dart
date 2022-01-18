import 'dart:convert';

import 'package:dhun/services/RegisterServices.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test("User Register", () async {
    bool expected = true;

    var userServices = RegisterServices();
    var body = {
      "username":"Bidhan_rai",
      "email": "bidhan@gmail.com",
      "password": "raitorai123",

    };
    var response = await userServices.Register(body);
    var resBody = json.decode(response.toString());
    bool received = resBody["success"];
    expect(expected, received);
  });
}