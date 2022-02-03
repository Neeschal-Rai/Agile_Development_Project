import 'dart:convert';

import 'package:dhun/screens/artistlistscreen.dart';
import 'package:dhun/screens/createplaylist.dart';
import 'package:dhun/screens/favoritescreeen.dart';
import 'package:dhun/services/DeletePlaylistServices.dart';
import 'package:dhun/services/GetPlaylistServices.dart';
import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool pressed = false;
  getplaylistData() async {
    try {
      var getplaylistServices = GetPlaylistServices();
      var response = await getplaylistServices.getallplaylist();
      return response;
    } catch (e) {
      print(e);
    }
  }

  deletePlaylistData(String playlistid) async {
    try {
      var deleteplaylistServices = DeletePlaylistServices();
      var response = await deleteplaylistServices.deleteplaylist(playlistid);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<void> _optionsDialogBox(String playlistid) {
    return showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.deepPurple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    TextButton(
                      onPressed: () async {

                      },
                      child: const Text("Delete playlist",
                          style:
                         TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)
                      )
                    ),
                      Card(
                        child: IconButton(
                        iconSize: 45.0,
                        color: Colors.red,
                        onPressed: () async{
                          var response =
                          json.decode(await deletePlaylistData(playlistid));
                          print(response["success"]);
                          if (response["success"] == true) {
                            Fluttertoast.showToast(
                                msg: 'Deleted Successfullly',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.deepPurple,
                                textColor: Colors.white);
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => super.widget));
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                    ),
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

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
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20),
                    child: Text('My Library',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20),
                    child: IconButton(
                      icon: const Icon(
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
                              title: const Text("Create playlist",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              content: const Text(
                                  "Are you sure want to create new playlist?",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Cancel",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text("Ok",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CreatePlaylist()),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ArtistScreeen()),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.transparent,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: const Text("Artists",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
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
                        child: const Text("Albums",
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
                        child: const Text("playlists",
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
                      builder: (context) => const FavoriteScreen()),
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
                            children: const [
                              Text('Liked songs',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
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


              SingleChildScrollView(
                child: FutureBuilder(
                  future: getplaylistData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        dynamic data = jsonDecode(
                            jsonDecode(snapshot.data.toString()))["data"];
                        print(data);

                    if (data.length > 0) {
                      dynamic data = jsonDecode(
                          jsonDecode(snapshot.data.toString()))["data"];
                      return Column(children: [

                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0, color: Colors.black),
                                    color: Colors.black,
                                  ),
                                  child: Card(
                                    color: Colors.deepPurpleAccent,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.asset(
                                              "assets/images/playlist.png",
                                              height: 80,
                                              width: 80,
                                              fit: BoxFit.contain),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 50.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${data[index]["playlistname"]}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 5),
                                                  child: Text('202 songs',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: 30.0,
                                          color: Colors.white,
                                          onPressed: () {
                                            _optionsDialogBox(
                                                data[index]["_id"]);
                                          },
                                          icon: const Icon(
                                            Icons.more_vert,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ]);
                    } else {
                      return Column(
                        children: const [
                          SizedBox(
                            height: 200,
                          ),
                        Center(
                            child: Text(
                              'No playlist',
                              textScaleFactor: 2,
                              style: TextStyle(color: Colors.white),
                            )),
                        ]
                      );
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
