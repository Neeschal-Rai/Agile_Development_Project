import 'dart:convert';
import 'dart:io';
import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/screens/followingartistscreen.dart';
import 'package:dhun/screens/settingspagescreen.dart';
import 'package:dhun/screens/updateprofilescreen.dart';
import 'package:dhun/services/FollowArtistServices.dart';
import 'package:dhun/services/ProfileServices.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dhun/screens/loginscreen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpsectionscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  getData() async {
    print(user_id_login);

    try {
      var profileServices = ProfileServices();
      var response = await profileServices.getUser(user_id_login);
      return response;
    } catch (e) {
      print(e);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: getData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Text('Error');
                        case ConnectionState.waiting:
                          return Text('Loading');
                        default:
                          if (snapshot.hasError) {
                            return const Center(
                                child: Text(
                              'Error occured',
                              textScaleFactor: 3,
                              style: TextStyle(color: Colors.black),
                            ));
                          } else {
                            dynamic data = jsonDecode(
                                jsonDecode(snapshot.data.toString()))["data"];
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text("My profile",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                if (data["profilepic"] != null)
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 40.0),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                BASE_URL + data["profilepic"]),
                                            fit: BoxFit.cover)),
                                  )
                                else
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 40.0),
                                    width: 100,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/no-image.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(data["username"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(data["email"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Updateprofile()));
                                    },
                                    child: const Text("Edit",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.deepPurpleAccent),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text('Following',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text('Followers',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FutureBuilder(
                                        future: getfollowedartist(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<dynamic> snapshot) {
                                          if (snapshot.hasData) {
                                            dynamic data = jsonDecode(
                                                jsonDecode(snapshot.data
                                                    .toString()))["data"];
                                            return GestureDetector(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const FollowingScreen()),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Text(
                                                    data.length.toString(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Container();
                                          } else {
                                            return Container();
                                          }
                                        }),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Text('0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10.0),
                                  width: 380,
                                  height: 215,
                                  child: Card(
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                left: 20,
                                                bottom: 10),
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()),
                                              ),
                                              child: const Text(
                                                "Notifications",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                left: 20,
                                                bottom: 10),
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SettingsScreen()),
                                              ),
                                              child: const Text(
                                                "Settings",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                left: 20,
                                                bottom: 10),
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HelpScreen()),
                                              ),
                                              child: const Text('Help section',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                            thickness: 3,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                left: 20,
                                                bottom: 10),
                                            child: InkWell(
                                              onTap: () => {logout()},
                                              child: const Text(
                                                "Logout",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                            thickness: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                      }
                    },
                  ),
                ))));
  }

  void logout() async {
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    user_id = "";
    userprefs.clear();
    Fluttertoast.showToast(
        msg: 'Logged out!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepPurple,
        textColor: Colors.white);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
