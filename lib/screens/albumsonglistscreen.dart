import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/services/AlbumUploadServices.dart';
import 'package:flutter/material.dart';

class AlbumSongListScreen extends StatefulWidget {
  final String id;

  const AlbumSongListScreen({required this.id});


  @override
  _AlbumSongListScreenState createState() => _AlbumSongListScreenState();
}

class _AlbumSongListScreenState extends State<AlbumSongListScreen> {
  getalbumsongdata() async {
    try {
      var albumServices = UploadAlbumServices();
      var response = await albumServices.getalbumsongdata(widget.id);
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
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),

                ],
              ),

              Expanded(
                child: FutureBuilder(
                  future: getalbumsongdata(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


                    if (snapshot.hasData) {
                      dynamic data = jsonDecode(
                          jsonDecode(snapshot.data.toString()))["data"];
                      print(data);
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 300,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                BASE_URL + data["album_image"]),
                                            fit: BoxFit.cover)),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0, left: 10),
                                        child: Text(data["album_name"],
                                            style: const TextStyle(
                                                color: Colors.deepPurpleAccent,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('${data["album_file"].length} songs',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Songs",
                                  style: TextStyle(color: Colors.white, fontSize:20,fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: data["album_file"].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border:
                                      Border.all(width: 0, color: Colors.black),
                                      color: Colors.black,
                                    ),
                                    margin: const EdgeInsets.only(
                                        top: 20.0, left: 10, right: 10),
                                    child: Card(
                                      color: Colors.black,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20.0),
                                            child: Image.asset("assets/images/music.png",
                                                height: 50, width: 50, fit: BoxFit.contain),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 30.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: const [
                                                    Text(
                                                        "music 1",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold)),
                                                    Padding(
                                                      padding:
                                                      EdgeInsets
                                                          .only(top: 5),
                                                      child: Text(
                                                          "fae",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                              FontWeight
                                                                  .normal)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),



                          ],
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
