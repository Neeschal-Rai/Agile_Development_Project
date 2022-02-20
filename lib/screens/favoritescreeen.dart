import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/services/DeleteFromFavoriteServices.dart';
import 'package:dhun/services/GetFavoritesServices.dart';
import 'package:dhun/services/GetSelectedSongServices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  getFavoriteData() async {
    try {
      var getfavServices = GetFavoriteServices();
      var response = await getfavServices.getfavorites(user_id_login);
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }

  getselectedsong(String id) async {
    try {
      var getServices = GetSelectedSongServices();
      var response = await getServices.getsong(id);
      return response;
    } catch (e) {
      print(e);
    }
  }

  deletefavorite(String id) async {
    try {
      var delServices = DeleteFromFavoriteServices();
      var response = await delServices.deletefavorites(id);
      return response;
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
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10),
                    child: Text('Liked songs',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: getFavoriteData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Error');
                      case ConnectionState.waiting:
                        return Text('Loading');
                      default:
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text(
                            'No favorite songs',
                            textScaleFactor: 3,
                            style: TextStyle(color: Colors.black),
                          ));
                        } else {
                          dynamic data = jsonDecode(
                              jsonDecode(snapshot.data.toString()))["data"];
                          return SizedBox(
                            height: 270,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                getselectedsong(data[index]["songid"]);
                                print(index);
                                return FutureBuilder(
                                    future:
                                        getselectedsong(data[index]["songid"]),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<dynamic> snapshot) {
                                      if (snapshot.hasData) {
                                        dynamic songdata = jsonDecode(
                                            jsonDecode(snapshot.data
                                                .toString()))["data"];
                                        print(songdata);
                                        return Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0, color: Colors.black),
                                            color: Colors.black,
                                          ),
                                          margin: const EdgeInsets.only(
                                              top: 20.0, left: 10, right: 10),
                                          child: Card(
                                            color: Colors.black,
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  width: 60,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              BASE_URL +
                                                                  songdata[0][
                                                                      "song_image"]),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Expanded(
                                                  child: GestureDetector(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 30.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              songdata[0]
                                                                  ["song_name"],
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .deepPurpleAccent,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 5),
                                                            child: Text(
                                                                songdata[0][
                                                                    "song_artist"],
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 60.0),
                                                  child: IconButton(
                                                    iconSize: 30.0,
                                                    color: Colors.red,
                                                    onPressed: () async {
                                                      var response = json.decode(
                                                          await deletefavorite(
                                                              data[index]
                                                                  ["_id"]));
                                                      if (response["success"] =
                                                          true) {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'Deleted successfully',
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .BOTTOM,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                Colors
                                                                    .deepPurple,
                                                            textColor:
                                                                Colors.white);
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        FavoriteScreen()));
                                                      }
                                                    },
                                                    icon: const Icon(
                                                      Icons.favorite,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                            child: Text(
                                          'No favorite songs',
                                          textScaleFactor: 3,
                                          style: TextStyle(color: Colors.white),
                                        ));
                                      }
                                    });
                              },
                            ),
                          );
                        }
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
