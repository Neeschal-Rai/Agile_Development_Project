import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/screens/albumsonglistscreen.dart';
import 'package:dhun/services/AlbumUploadServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'artistlistscreen.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {

  getalbumData() async {
    try {
      var albumServices = UploadAlbumServices();
      var response = await albumServices.getalbumdata();
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
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 115,
                ),
                const Center(
                  child: Text(
                    "Albums",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
              Expanded(
                child: FutureBuilder(
                  future: getalbumData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      dynamic data = jsonDecode(
                          jsonDecode(snapshot.data.toString()))["data"];
                      return SizedBox(
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AlbumSongListScreen(id: data[index]["_id"])),
                                ),
                                child: Card(
                            color: Colors.deepPurpleAccent,
                            elevation: 5.0,
                            shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    width: 200,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                        image: DecorationImage(
                                            // image: NetworkImage("https://picsum.photos/250?image=9"),
                                            image: NetworkImage(BASE_URL +
                                                data[index]["album_image"]),
                                            fit: BoxFit.cover)),
                                  ),

                                  Text(data[index]["album_name"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                            ),
                          ),
                              ),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 2.5 : 2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              )
            ],
          ),
        )));
  }
}
