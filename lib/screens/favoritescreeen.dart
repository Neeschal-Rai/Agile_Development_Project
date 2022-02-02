import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/services/GetFavoritesServices.dart';
import 'package:dhun/services/GetSelectedSongServices.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  dynamic songdata;

  getFavoriteData() async {
    try {
      var getfavServices = GetFavoriteServices();
      var response = await getfavServices.getfavorites(user_id_login);
      return response;
    } catch (e) {
      print(e);
    }
  }

  getselectedsong(String id) async {
    try {
      var getServices = GetSelectedSongServices();
      var response = await getServices.getsong(id);
      songdata = jsonDecode(jsonDecode(response.toString()))["data"];
      print(songdata);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () {
                     Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  IconButton(
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                const [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10),
                    child: Text('Liked songs',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('105 songs',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: getFavoriteData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      dynamic data = jsonDecode(
                          jsonDecode(snapshot.data.toString()))["data"];
                      getselectedsong(data[0]["songid"]);

                      return SizedBox(
                        height: 270,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0, color: Colors.black),
                                color: Colors.black,
                              ),
                              margin: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                              child: Card(
                                color: Colors.black,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      width: 60,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(BASE_URL +
                                                  songdata["song_image"]),
                                              fit: BoxFit.cover)),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 30.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(songdata["song_name"],
                                                  style: const TextStyle(
                                                      color:
                                                          Colors.deepPurpleAccent,
                                                      fontSize: 18,
                                                      fontWeight
                                                          : FontWeight.bold)),
                                              Padding(
                                                padding: EdgeInsets.only(top: 5),
                                                child: Text(songdata["song_artist"],
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 60.0),
                                      child: IconButton(
                                        iconSize: 30.0,
                                        color: Colors.white,
                                        onPressed: () async{
                                          var response = await()
                                        },
                                        icon: const Icon(
                                          Icons.shuffle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                          child: Text(
                        'Error occured',
                        textScaleFactor: 3,
                        style: TextStyle(color: Colors.white),
                      ));
                      ;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
