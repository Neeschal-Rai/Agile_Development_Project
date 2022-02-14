import 'dart:convert';

import 'package:dhun/services/GetPlaylistServices.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test("get playlist", () async {
    bool expected = true;

    var playlistServices = GetPlaylistServices();

    var response = await playlistServices.getallplaylist();
    var resBody = jsonDecode(
        jsonDecode(response.toString()));
    bool received = resBody["success"];
    expect(expected, received);
  });
}