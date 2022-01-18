import 'dart:convert';

import 'package:dhun/Services/LoginServices.dart';
import 'package:dhun/component/Model/User.dart';
import 'package:dhun/screens/dashboardscreen.dart';
import 'package:dhun/screens/homepagescreen.dart';
import 'package:dhun/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final items = ["User", "Artist"];
  String? value;
  bool _isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String usertype = "user";

  postData() async {
    try {
      var body = {"email": email, "password": password, "usertype": usertype};
      var userServices = LoginServices();
      var response = await userServices.Login(body);
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
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                SizedBox(height: 20),
                Container(
                  child: Image.asset("assets/images/logos.png",
                      height: 200, width: 200, fit: BoxFit.contain),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email Address",
                            style: TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: emailController,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: new InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15),
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text("Usertype",
                              style: TextStyle(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                iconSize: 20,
                                dropdownColor: Colors.black,
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.deepPurple, size: 30),
                                isExpanded: true,
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value = value),
                              ),
                            ),
                          ),
                        ),
                        Text("Password", style: TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: passwordController,
                            obscureText: _isObscure,
                            onChanged: (value) {
                              print(value);
                              password = value;
                            },
                            decoration: new InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15),
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var response = await postData();
                              var res = json.decode(response);
                              if (res["success"] == true) {
                                SharedPreferences userprefs = await SharedPreferences.getInstance();
                                userprefs.setString("userid", res["userId"]);
                                userprefs.clear();
                                Fluttertoast.showToast(
                                    msg: 'yeta',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.deepPurple,
                                    textColor: Colors.white);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                                final snackB =
                                    SnackBar(content: Text(res["message"]));
                              }
                            } else {
                              print("Error");
                            }
                          },
                          child: Text("Log In")),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("If you are new, please ",
                        style: TextStyle(color: Colors.white)),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      ),
                      child: Text(
                        "Register here.",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(color: Colors.deepPurple),
      ));
}
