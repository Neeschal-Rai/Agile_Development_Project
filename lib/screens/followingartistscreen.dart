import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/services/FollowArtistServices.dart';
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


  getfollowedartist() async {
    try {
      var followartistServices = FollowArtistServices();
      var response =
          await followartistServices.getfollowingrtist(user_id_login);
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
                    "Artists",
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
                    print(data);
                    if (data.isEmpty != true) {
                      return SizedBox(
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
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
                                                data[index]["profilepic"]),
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(data[index]["username"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  ElevatedButton(
                                      onPressed: () async {
                                        var response = json.decode(
                                            await unfollowartist(
                                                data[index]["_id"]));
                                        if (response["success"] == true) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  'Artist followed successfully',
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
                          ),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 3 : 3),
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
