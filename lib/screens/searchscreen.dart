import 'dart:async';
import 'dart:convert';
import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/services/SearchSongsServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  String url = 'https://type.fit/api/quotes';



  Future<List<Song>> getAllulistList() async {
    try {

      var res =
      await http.get(Uri.parse(searchsongfromApi));


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
    final parsed = json.decode(responseBody)["data"].cast<Map<String, dynamic>>();

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
    return SafeArea(
      child: Scaffold(
       
        body: Column(
          children: <Widget>[
            //Search Bar to List of typed Song
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  suffixIcon: InkWell(
                    child: Icon(Icons.search),
                  ),
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Search ',
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
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              songLists[index].song_name ??"nothign",
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              songLists[index].song_name ?? "null",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
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
  Song({
    required this.song_name,
    required this.song_artist,
    required this.song_image,
    required this.id
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      song_name: json['song_name'],
      song_artist: json['song_artist'],
      song_image: json['song_image'],
      id: json["_id"]
    );
  }
}