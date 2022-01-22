import 'dart:convert';

import 'package:dhun/services/ProfileServices.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test("User Profile", () async {
    bool expected = true;
    var profileServices = ProfileServices();
    var response = await profileServices.getUser("61e6adfe29ff7fa5e8c43cb1");
    var resBody = jsonDecode(
        jsonDecode(response.toString()));
    bool received = resBody["success"];
    expect(expected, received);
  });
}