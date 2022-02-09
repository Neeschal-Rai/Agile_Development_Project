import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/screens/chooseuploadscreen.dart';
import 'package:dhun/screens/musicscreen.dart';
import 'package:dhun/screens/uploadsongscreen.dart';
import 'package:dhun/services/GetSongServices.dart';
import 'package:dhun/services/ProfileServices.dart';
import 'package:flutter/material.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({Key? key}) : super(key: key);

  @override
  _DashboardscreenState createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  final top_pad = const EdgeInsets.all(20);
  final extra_pad = const EdgeInsets.only(left: 20);
  getData() async {
    print(user_id_login);

    try {
      var profileServices = ProfileServices();
      var response = await profileServices.getUser(user_id_login);
      dynamic profiledata = jsonDecode(
          jsonDecode(response.toString()))["data"];
      print(profiledata);
      username_log = profiledata["username"];
      return response;
    } catch (e) {
      print(e);
    }
  }

  getSongData() async {
    try {
      var getsongServices = GetSongServices();
      var response = await getsongServices.getsongs();
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 3],
                colors: [
                  Colors.deepPurple,
                  Colors.black,
                ],
              )),
          child: SingleChildScrollView(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: top_pad,
                    child: Text("WELCOME ${username_log}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: top_pad,
                    child: const Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: extra_pad,
                child: const Text("RECENTLY PLAYED",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              FutureBuilder(
                future: getSongData(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    dynamic data = jsonDecode(
                        jsonDecode(snapshot.data.toString()))["data"];

                    return SizedBox(
                      height: 270,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length ,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:8.0, right: 8),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MusicScreen(id: data[index]["_id"])),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(BASE_URL +
                                                data[index]["song_image"]),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: extra_pad,
                                child: Text('${data[index]["song_name"]}',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              Padding(
                padding: extra_pad,
                child: const Text("POPULAR SONGS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 270,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8),
                          child: Image.asset("assets/images/download.jpg",
                              height: 200, width: 200, fit: BoxFit.contain),
                        ),
                        Padding(
                          padding: extra_pad,
                          child: const Text('Hamro Nepal ma',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8.0, right: 8),
                          child: Image.asset("assets/images/download.jpg",
                              height: 200, width: 200, fit: BoxFit.contain),
                        ),
                        Padding(
                          padding: extra_pad,
                          child: const Text("Naganya maya",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: extra_pad,
                child: const Text("LATEST RELEASES",
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
                              child: const Text("Hamro Nepal Ma",
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
                              child: const Text("Naganya maya",
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
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChooseUploadScreen()),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 29,
          ),
          backgroundColor: Colors.deepPurple,
          tooltip: 'Capture Picture',
          elevation: 5,
          splashColor: Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}