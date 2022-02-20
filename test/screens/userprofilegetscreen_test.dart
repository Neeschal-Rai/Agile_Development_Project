import 'dart:convert';

import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/services/ProfileServices.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test("User Profile", () async {
    bool expected = true;
    var profileServices = ProfileServices();
    var response = await profileServices.getUser("62111fd2e9475e050fe3612e");
    var resBody = jsonDecode(
        jsonDecode(response.toString()));
    bool received = resBody["success"];
    expect(expected, received);
  });
}