import 'dart:convert';
import 'dart:io';

import 'package:dhun/component/Model/User.dart';
import 'package:dhun/screens/updateprofilescreen.dart';
import 'package:dhun/services/ProfileServices.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/screens/loginscreen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  getData() async {
    try {
      var userServices = ProfileServices();
      var response = await userServices.getUser();
      print(response);
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
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  print(snapshot.data);
                  if(snapshot.hasData){
                    print("heegag");
                    dynamic data = jsonDecode(jsonDecode(snapshot.data.toString()))["data"];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text("My profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 40.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(data["username"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(data["email"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Updateprofile()));
                            },
                            child: Text("Edit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurpleAccent),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('Following',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('Followers',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text('14',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20, bottom: 10),
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    ),
                                    child: const Text(
                                      "Notifications",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20, bottom: 10),
                                  child: Text('Settings',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20, bottom: 10),
                                  child: Text('Help section',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 20, bottom: 10),
                                  child: InkWell(
                                    onTap: () => {logout()

                                    },
                                    child: Text(
                                      "Logout",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }else{
                  return Container(); //or show a loading spinner
                  }




                },

      ),

    ))));

  }

  void logout() async{
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    userprefs.clear();
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen()),
    );

  }
}
