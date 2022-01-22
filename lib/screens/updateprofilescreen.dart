import 'dart:convert';

import 'package:dhun/services/ProfileServices.dart';
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
  Future<void> _optionsDialogBox() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextButton(
                  onPressed: () => OpenCamera()
            ,
                  child: Text("Open camera"),

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

  getData() async {
    SharedPreferences userprefs = await SharedPreferences.getInstance();
    final String user_id = userprefs.getString("userid");
    try {
      var profileServices = ProfileServices();
      var response = await profileServices.getUser("61e6adfe29ff7fa5e8c43cb1");
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/profile.jpg"),
                          ),
                        ),
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
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.deepPurple),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt_rounded),
                            onPressed: () {
                              _optionsDialogBox();
                            }
                            ,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    labelText: "Username",
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                    hintText: data["username"],
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.deepPurple),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 35.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(bottom: 3),
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    hintText: data["email"],
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.deepPurple),
                                    )),
                              ),
                            ),

                          ],
                        ),
                      );
                    } else {
                      return
                          Center(// heightFactor: 3,
                            // widthFactor: 0.8,
                            child: Container(

                              child: Text(
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Updateprofile()));
                  },
                  child: Text("Edit",
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

            ],
          ),
        ),
      ),
    );
  }

  void OpenCamera() async{
    var picture = await ImagePicker().pickImage( source: ImageSource.camera
    );
  }

}
