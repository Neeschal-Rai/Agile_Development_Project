import 'package:dhun/screens/createplaylist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test create playlist page', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.

    await tester.pumpWidget(const MaterialApp(home: CreatePlaylist()));
    final addplaylist = find.byKey(const ValueKey("playlist"));
    final createplaylistbtn = find.byKey(ValueKey("createplaylist"));

    await tester.enterText(addplaylist, "chill");
    await tester.pump(Duration(seconds: 10));
    await tester.tap(createplaylistbtn);
    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 5));

    //
  });
}
