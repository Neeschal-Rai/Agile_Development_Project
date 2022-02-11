import 'package:dhun/screens/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test register page', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.

    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));
    final addemail = find.byKey(ValueKey("emailfield"));
    final addusername = find.byKey(ValueKey("usernamefield"));
    final addusertype = find.byKey(ValueKey("usertypefield"));
    final addpassword = find.byKey(ValueKey("passwordfield"));
    final addconfirmpassword = find.byKey(ValueKey("cpasswordfield"));
    final registerbtn = find.byKey(ValueKey("registerbutton"));

    await tester.enterText(addemail, "email@gmail.com");
    await tester.pump(Duration(seconds: 5));
    await tester.enterText(addusername, "usernamehere");
    await tester.pump(const Duration(seconds: 5));
    await tester.tap(addusertype);
    await tester.pumpAndSettle();
    final dropdownItem = find.text('User').last;
    await tester.tap(dropdownItem);

    await tester.pump(const Duration(seconds: 5));
    //
    await tester.enterText(addpassword, "abcdefghr");
    await tester.pump(const Duration(seconds: 5));
    await tester.enterText(addconfirmpassword, "abcdefghr");
    await tester.pump(const Duration(seconds: 5));

    await tester.tap(registerbtn);
    await tester.pumpAndSettle();
  });
}
