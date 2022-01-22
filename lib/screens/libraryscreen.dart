import 'package:dhun/screens/createplaylist.dart';
import 'package:dhun/screens/favoritescreeen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'loginscreen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20),
                    child: Text('My Library',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                      ),
                      iconSize: 30,
                      color: Colors.white,
                      splashColor: Colors.deepPurple,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.deepPurple,
                              title: Text("Create playlist", style: TextStyle(
                                color: Colors.white,
                              )),
                              content: Text("Are you sure want to create new playlist?",style: TextStyle(
                                color: Colors.white,
                              )),
                              actions: <Widget>[
                                TextButton(
                                  child: new Text("Cancel",style: TextStyle(
                                    color: Colors.white,
                                  )),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: new Text("Ok",style: TextStyle(
                                    color: Colors.white,
                                  )),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );

                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0, right: 20),
                  //   child: Icon(
                  //     Icons.add,
                  //     size: 30,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text("Artists",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text("Albums",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text("playlists",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavoriteScreen()),
                ),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.black),
                    color: Colors.black,
                  ),
                    margin: const EdgeInsets.only(top: 30.0),
                  child: Card(
                    color: Colors.deepPurpleAccent,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset("assets/images/lover.png",
                              height: 60, width: 80, fit: BoxFit.contain),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 50.0, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Liked songs',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text('105 songs',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.black),
                color: Colors.black,
              ),
              child: Card(
                color: Colors.deepPurpleAccent,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset("assets/images/sabinrai.jpg",
                          height: 80, width: 80, fit: BoxFit.contain),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mood',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('202 songs',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0, color: Colors.black),
              color: Colors.black,
            ),
            child: Card(
              color: Colors.deepPurpleAccent,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset("assets/images/sabinrai.jpg",
                        height: 80, width: 80, fit: BoxFit.contain),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nepali songs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('202 songs',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
