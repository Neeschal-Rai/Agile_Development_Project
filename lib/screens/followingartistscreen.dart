import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/services/FollowArtistServices.dart';
import 'package:dhun/services/GetAllArtistDataServices.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  String text1 = "unfollow";
  dynamic artistdata;
  getfollowedartist() async {
    try {
      var followartistServices = FollowArtistServices();
      var response =
      await followartistServices.getfollowingartist(user_id_login);
      return response;
    } catch (e) {
      print(e);
    }
  }
  getfollowfromartist(artistid) async {
    try {
      var followartistServices = GetAllArtistDataServices();
      var response =
      await followartistServices.getartistsfromid(artistid);
      artistdata=jsonDecode(jsonDecode(response.toString()))["data"];
      print(artistdata);
      return response;
    } catch (e) {
      print(e);
    }
  }


  unfollowartist(followid) async {
    try {
      var followartistServices = FollowArtistServices();
      var response =
      await followartistServices.unfollowartist(followid);
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
                    "Following",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
              Expanded(
                child: FutureBuilder(
                  future: getfollowedartist(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    dynamic data = jsonDecode(
                        jsonDecode(snapshot.data.toString()))["data"];
                    print(data.length);
                    if (data.isEmpty != true) {
                      return SizedBox(
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index){
                          getfollowfromartist(data[index]["artistid"]);
                              return Card(
                            color: Colors.black,
                            elevation: 5.0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            // image: NetworkImage("https://picsum.photos/250?image=9"),
                                            image: NetworkImage(BASE_URL +
                                                artistdata[0]["profilepic"]),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(artistdata[0]["username"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  ElevatedButton(
                                      onPressed: () async {
                                        var response = json.decode(
                                            await unfollowartist(
                                                data[0]["_id"]));
                                        print(response);
                                        if (response["success"] == true) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Artist unfollowed successfully',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor:
                                                  Colors.deepPurple,
                                              textColor: Colors.white);
                                          setState(() {
                                            text1 = "unfollow";
                                          });
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) => super.widget));
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.deepPurpleAccent),
                                      ),
                                      child: Text(text1,
                                          style: const TextStyle(
                                              color: Colors.white))),
                                ],
                              ),

                              // ),
                            ),
                          );},
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 3 : 3),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      );
                    } else {
                      return  Column(children: const [
                        SizedBox(
                          height: 200,
                        ),
                        Center(
                            child: Text(
                              'No followed artists',
                              textScaleFactor: 2,
                              style: TextStyle(color: Colors.white),
                            )),
                      ]);
                    }
                  },
                ),
              )
            ],
          ),
        )));
  }
}
