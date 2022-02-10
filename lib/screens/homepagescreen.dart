import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dhun/screens/dashboardscreen.dart';
import 'package:dhun/screens/libraryscreen.dart';
import 'package:dhun/screens/profilescreen.dart';
import 'package:dhun/screens/searchscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int index;

  const HomeScreen({required this.index});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late int index = widget.index;
  final screens=[
    Dashboardscreen(),
    SearchScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    print(index);
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
          items: const <Widget>[
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
