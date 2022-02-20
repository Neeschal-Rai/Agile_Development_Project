

import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/screens/albumuploadscreen.dart';
import 'package:dhun/screens/chooseuploadscreen.dart';
import 'package:dhun/screens/dashboardscreen.dart';
import 'package:dhun/screens/followingartistscreen.dart';
import 'package:dhun/screens/homepagescreen.dart';
import 'package:dhun/screens/otpscreen.dart';
import 'package:dhun/screens/profilescreen.dart';
import 'package:dhun/screens/registerscreen.dart';
import 'package:dhun/screens/uploadsongscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'loginscreen.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  bool prefsexists=false;
  checkLogin() async {
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    print(userprefs.getString("userid"));
    if (userprefs.containsKey("userid")) {
      user_id=userprefs.getString("userid");
      setState(() {
        prefsexists=true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    checkLogin();
    print(prefsexists);
  }

    @override
  Widget build(BuildContext context) {
    if(prefsexists) {
      return Center(
          child: SplashScreen(
              seconds: 5,
              navigateAfterSeconds: const HomeScreen(
                index: 0,
              ),
              image: Image.asset("assets/images/logo.png",
                  height: 200, width: 200, fit: BoxFit.contain),
              backgroundColor: Colors.black,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              loaderColor: Colors.red));
    }else{
      return Center(
          child: SplashScreen(
              seconds: 5,
              navigateAfterSeconds: LoginScreen(),
              image: Image.asset("assets/images/logo.png",
                  height: 200, width: 200, fit: BoxFit.contain),
              backgroundColor: Colors.black,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              loaderColor: Colors.red));
    }

  }
}
