
import 'package:dhun/screens/dashboardscreen.dart';
import 'package:dhun/screens/homepagescreen.dart';
import 'package:dhun/screens/profilescreen.dart';
import 'package:dhun/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'loginscreen.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  Future<Widget> checkLogin() async {
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    if(userprefs.containsKey("userid")){
      return HomeScreen();
    }else{
      return LoginScreen();
    }

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body:
        Builder(
            builder: (context) {
              return Center(
                  child:
                  SplashScreen(
                      seconds: 5,
                      navigateAfterSeconds: HomeScreen(),
                      image: Image.asset("assets/images/logo.png",
                          height: 200, width: 200, fit: BoxFit.contain),
                      backgroundColor: Colors.black,
                      styleTextUnderTheLoader: new TextStyle(),
                      photoSize: 100.0,
                      loaderColor: Colors.red
                  )
              );
            }
        ));
  }
}
