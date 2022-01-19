import 'dart:convert';

import 'package:dhun/services/ProfileServices.dart';
import 'package:flutter/material.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({Key? key}) : super(key: key);

  @override
  _UpdateprofileState createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  getData() async {
    try {
      var profileServices = ProfileServices();
      var response = await profileServices.getUser();
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
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.deepPurple),
                          child: Icon(
                            Icons.camera,
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

}
