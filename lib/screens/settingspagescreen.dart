import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/services/ProfileServices.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  deleteUser() async {
    try {
      var userServices = ProfileServices();
      var response =
      await userServices.deleteUser("61e6adfe29ff7fa5e8c43cb1");
      return response;
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.deepPurple,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              color: Colors.deepPurple,
              height: 15,
              thickness: 1.5,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text("Change Password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),

                              decoration: const InputDecoration(
                                hintText: "Old password",
                                contentPadding: EdgeInsets.only(bottom: 3),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                            TextFormField(
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),

                              decoration: const InputDecoration(
                                hintText: "New password",
                                contentPadding: EdgeInsets.only(bottom: 3),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                            TextFormField(
                              cursorColor: Colors.black,

                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),

                              decoration: const InputDecoration(
                                hintText: "Confirm password",
                                contentPadding: EdgeInsets.only(bottom: 3),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("close"),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.lock_open,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Change Password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Option 1"),
                            Text("Option 2"),
                            Text("Option 3"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("close"),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.privacy_tip_sharp,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Privacy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.deepPurple,
                        title: const Text("Change Password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Security"),
                          ]
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("close"),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.security_sharp,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Security',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.deepPurple,
                  )
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 20, bottom: 10),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.deepPurple,
                        title: Row(
                            children: [
                              IconButton(
                                iconSize: 45.0,
                                color: Colors.red,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),

                              const Text("Delete Account",
                                  style: TextStyle(
                                    color: Colors.red,
                                  )),
                            ]),
                        content: const Text(
                            "Are you sure want to delete your account?",
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
                            onPressed: () async{
                              var deleteresponse = await deleteUser();
                              print(deleteresponse);
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const LoginScreen()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Delete my account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 20, bottom: 10),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.deepPurple,
                        title: Row(
                            children: [
                              IconButton(
                                iconSize: 45.0,
                                color: Colors.red,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),

                              const Text("Delete Account",
                                  style: TextStyle(
                                    color: Colors.red,
                                  )),
                            ]),
                        content: const Text(
                            "Are you sure want to delete your account?",
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
                            onPressed: () async{
                              var deleteresponse = json.decode(await deleteUser());
                              print(deleteresponse);
                              if (deleteresponse["success"]==true){
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginScreen()),
                                );
                              }

                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Delete my account",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              children: const [
                Icon(
                  Icons.info,
                  color: Colors.deepPurple,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "About",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              color: Colors.deepPurple,
              height: 15,
              thickness: 1.5,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 12,
                  ),
                  Text('Version',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text('8.65.7.1240',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 12,
                  ),
                  Text('Terms and Conditions',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text('All the stuff you need to know',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 12,
                  ),
                  Text('Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text('Your personal information protection',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
