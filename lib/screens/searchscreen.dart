import 'dart:async';
import 'dart:convert';
import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/services/SearchSongsServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'musicscreen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen() : super();

  @override
  SearchScreenState createState() => SearchScreenState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class SearchScreenState extends State<SearchScreen> {
  final _debouncer = Debouncer();

  List<Song> ulist = [];
  List<Song> songLists = [];

  //API call for All Song List

  Future<List<Song>> getAllulistList() async {
    try {
      var res = await http.get(Uri.parse(searchsongfromApi));

      // var searchServices = SearchSongsServices();
      //
      // var response = await searchServices.searchsongs();
      // var responsedata = jsonDecode(
      //     jsonDecode(response.toString()))["data"];
      // print(responsedata);
      print(json.decode(res.body)["data"]);
      List<Song> list = parseAgents(res.body);
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Song> parseAgents(String responseBody) {
    final parsed =
        json.decode(responseBody)["data"].cast<Map<String, dynamic>>();

    return parsed.map<Song>((json) => Song.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((SongFromServer) {
      setState(() {
        ulist = SongFromServer;
        songLists = ulist;
      });
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Text("WELCOME ${username_log}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            //Search Bar to List of typed Song
            Container(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                cursorColor: Colors.white,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: const InkWell(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(15.0),
                  hintStyle: const TextStyle(fontSize: 20, color: Colors.white),
                  hintText: 'Search songs',
                ),
                onChanged: (string) {
                  _debouncer.run(() {
                    setState(() {
                      songLists = ulist
                          .where(
                            (u) => (u.song_name.toLowerCase().contains(
                                  string.toLowerCase(),
                                )),
                          )
                          .toList();
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.all(5),
                itemCount: songLists.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MusicScreen(id: songLists[index].id)),),
                    child: Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          BASE_URL + songLists[index].song_image),
                                      fit: BoxFit.cover)),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 50.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(songLists[index].song_name ?? "Error",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                          songLists[index].song_artist ?? "Error",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: <Widget>[
                        //     ListTile(
                        //       title: Text(
                        //         songLists[index].song_name ??"Error",
                        //         style: TextStyle(fontSize: 16, color: Colors.white),
                        //       ),
                        //       subtitle: Text(
                        //         songLists[index].song_artist ?? "null",
                        //         style: TextStyle(fontSize: 16, color: Colors.white),
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Song {
  var song_name;
  var song_artist;
  var song_image;
  var id;

  Song(
      {required this.song_name,
      required this.song_artist,
      required this.song_image,
      required this.id});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        song_name: json['song_name'],
        song_artist: json['song_artist'],
        song_image: json['song_image'],
        id: json["_id"]);
  }
}
