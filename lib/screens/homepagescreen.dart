import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dhun/screens/dashboard.dart';
import 'package:dhun/screens/mylibrary.dart';
import 'package:dhun/screens/profilepage.dart';
import 'package:dhun/screens/searchpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int index = 0;
  final screens=[
    Dashboardscreen(),
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body:screens[index],
      bottomNavigationBar: Theme(
        data:Theme.of(context).copyWith(
          iconTheme: IconThemeData(color:Colors.black),
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          animationCurve: Curves.ease,
          height: 50,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size:30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) => setState(()=> this.index=index ),

        ),
      ),
    );
  }
}
