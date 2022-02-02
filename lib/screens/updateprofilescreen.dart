import 'dart:convert';
import 'dart:io';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/screens/homepagescreen.dart';
import 'package:dhun/screens/settingsscreen.dart';
import 'package:dhun/services/ProfileServices.dart';
import 'package:dhun/services/UpdateProfileServices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({Key? key}) : super(key: key);

  @override
  _UpdateprofileState createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  File? imageFile;

  String user_id = "";
  String token = "";
  String username = "";
  String email = "";

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextButton(
                    onPressed: () => OpenCamera(),
                    child: Text("Open camera",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                    onPressed: () => OpenGallery(),
                    child: Text("Open gallery",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  )
                ],
              ),
            ),
          );
        });
  }

  updateData() async {
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    token = userprefs.getString("token");
    try {
      var body = {"username": username, "email": email, "image": imageFile};

      var updateprofileServices = UpdateProfileServices();
      var response =
          await updateprofileServices.updateprofile(user_id_login, "", body);
      return response;
    } catch (e) {
      print(e);
    }
  }

  getData() async {
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    user_id = userprefs.getString("userid");
    try {
      var profileServices = ProfileServices();
      var response = await profileServices.getUser("61e9027cd0f950d2bd6b5359");
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              FutureBuilder(
                  future: getData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      dynamic data = jsonDecode(
                          jsonDecode(snapshot.data.toString()))["data"];
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsPage()));
                                  },
                                )
                              ],
                            ),
                            const Center(
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Stack(
                                children: [
                                  if (imageFile != null)
                                    Center(
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(imageFile!)),
                                        ),
                                      ),
                                    )
                                  else
                                    Center(
                                      child: Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(BASE_URL +
                                                    data["profilepic"]),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  Positioned(
                                      bottom: 0,
                                      right: 125,
                                      top: 80,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 2,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                            color: Colors.deepPurple),
                                        child: IconButton(
                                          icon: Icon(Icons.camera_alt_rounded),
                                          onPressed: () {
                                            _optionsDialogBox();
                                          },
                                          color: Colors.white,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                controller: nameController,
                                onChanged: (value) {
                                  username = value;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    labelText: "Username",
                                    labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: data["username"],
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.deepPurple),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                controller: emailController,
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    labelText: "Email Address",
                                    labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: data["email"],
                                    hintStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.deepPurple),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: Container(
                          child: const Text(
                            'Error Occured',
                            textScaleFactor: 3,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await updateData();
                    print(response);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: const Text("Update",
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
            ],
          ),
        ),
      ),
    );
  }

  void OpenCamera() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.camera);
    print(picture);
    if (picture?.path != null) {
      setState(() {
        imageFile = File(picture!.path);
      });
    }
  }

  void OpenGallery() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(picture);
    if (picture?.path != null) {
      setState(() {
        imageFile = File(picture!.path);
      });
    }
  }
}
