import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dhun/screens/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({Key? key}) : super(key: key);

  @override
  _DashboardscreenState createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  final top_pad = const EdgeInsets.all(20);
  final extra_pad = const EdgeInsets.only(left: 20, top: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.003, 3],
                colors: [
                  Colors.deepPurple,
                  Colors.black,
                ],
              )),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: top_pad,
                      child: Text("WELCOME RUBY",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: top_pad,
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: extra_pad,
                  child: Text("RECENTLY PLAYED",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:15,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: SizedBox(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/download.jpg",
                                    height: 100, width: 200, fit: BoxFit.contain),
                              ),
                              Padding(
                                padding: extra_pad,
                                child: Text("Hamro Nepal Ma",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/naganya.jpg",
                                    height: 100, width: 200, fit: BoxFit.contain),
                              ),
                              Padding(
                                padding: extra_pad,
                                child: Text("Naganya maya",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: extra_pad,
                  child: Text("POPULAR SONGS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: SizedBox(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/download.jpg",
                                    height: 100, width: 200, fit: BoxFit.contain),
                              ),
                              Padding(
                                padding: extra_pad,
                                child: Text('Hamro Nepal ma',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/naganya.jpg",
                                    height: 100, width: 200, fit: BoxFit.contain),
                              ),
                              Padding(
                                padding: extra_pad,
                                child: Text("Naganya maya",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                    Padding(
                      padding: extra_pad,
                      child: Text("LATEST RELEASES",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      child: SizedBox(
                        height: 160,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/images/download.jpg",
                                        height: 100, width: 200, fit: BoxFit.contain),
                                  ),
                                  Padding(
                                    padding: extra_pad,
                                    child: Text("Hamro Nepal Ma",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/images/naganya.jpg",
                                        height: 100, width: 200, fit: BoxFit.contain),
                                  ),
                                  Padding(
                                    padding: extra_pad,
                                    child: Text("Naganya maya",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              ]),
            ),
          ));
  }
}
