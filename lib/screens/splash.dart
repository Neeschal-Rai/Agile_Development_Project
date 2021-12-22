
import 'package:dhun/screens/homepage.dart';
import 'package:dhun/screens/login.dart';
import 'package:dhun/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        Builder(
          builder: (context) {

            return Center(
              child:
              SplashScreen(
                  seconds: 5,
                  navigateAfterSeconds: new RegisterScreen(),
                  title: new Text('Welcome In SplashScreen'),
                  image: new Image.network('https://i1.sndcdn.com/avatars-000606604806-j6ghpm-t500x500.jpg'),
                  backgroundColor: Colors.white,
                  styleTextUnderTheLoader: new TextStyle(),
                  photoSize: 100.0,
                  loaderColor: Colors.red
              )
            );
          }
        ));
  }
}
