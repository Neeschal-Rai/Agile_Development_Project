import 'package:dhun/screens/loginscreen.dart';
import 'package:dhun/screens/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test login page', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.

    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));
    final addemail = find.byKey(const ValueKey("loginemail"));
    final addusertype = find.byKey(const ValueKey("usertypelogin"));
    final addpassword = find.byKey(const ValueKey("loginpassword"));
    final loginbtn = find.byKey(ValueKey("loginbtn"));

    await tester.enterText(addemail, "email@gmail.com");
    await tester.pump(Duration(seconds: 5));
    await tester.tap(addusertype);
    await tester.pumpAndSettle();
    final dropdownItem = find.text('User').last;
    await tester.tap(dropdownItem);
    await tester.enterText(addpassword, "abcdefghr");
    await tester.pump(const Duration(seconds: 5));

    await tester.tap(loginbtn);
    await tester.pumpAndSettle();

    await tester.pump(Duration(seconds: 5));
    //
  });
}
