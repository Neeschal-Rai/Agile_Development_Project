import 'dart:convert';

import 'package:dhun/Services/LoginServices.dart';
import 'package:dhun/component/Model/User.dart';
import 'package:dhun/constraints/userdata.dart';
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

  postData() async {
    try {
      var body = {"email": email, "password": password, "usertype": value};
      var registerServices = LoginServices();
      var response = await registerServices.Login(body);
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
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                SizedBox(height: 20),
                Container(
                  width: 150,
                  height: 120,
                  child: Image.asset("assets/images/logo.png",
                      height: 100, width: 300, fit: BoxFit.contain),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Email Address",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8),
                          child: TextFormField(
                            key: Key("loginemail"),
                            style: const TextStyle(color: Colors.white),
                            controller: emailController,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left:5.0, right: 5, top: 40),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1)),
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 6))),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Usertype",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 8),
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                key: Key("usertypelogin"),
                                value: value,
                                iconSize: 20,
                                dropdownColor: Colors.black,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.deepPurple, size: 30),
                                isExpanded: true,
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (value) => {
                                  setState(() => {this.value = value!}),
                                },
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8.0),
                          child: TextFormField(
                            key: Key("loginpassword"),
                            style: TextStyle(color: Colors.white),
                            controller: passwordController,
                            obscureText: _isObscure,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                                contentPadding: EdgeInsets.only(left:5.0, right: 5, top: 40),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    const BorderSide(color: Colors.white)),
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurpleAccent, width: 6))
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        ElevatedButton(
                            key: const Key("loginbtn"),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                var response = await postData();
                                var res = json.decode(response);
                                print(res);
                                if (res["success"] == true) {
                                  SharedPreferences userprefs =
                                      await SharedPreferences.getInstance();
                                  user_id = res["userId"];
                                  userprefs.setString("userid", res["userId"]);
                                  userprefs.setString("token", res["token"]);
                                  userprefs.clear();
                                  Fluttertoast.showToast(
                                      msg: 'Login successfully',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.deepPurple,
                                      textColor: Colors.white);
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(index: 0)),
                                  );
                                }
                                if (res["success"] == false) {
                                  Fluttertoast.showToast(
                                      msg: 'Invalid login',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.deepPurple,
                                      textColor: Colors.white);
                                }
                              } else {
                                print("Error");
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                Colors.deepPurpleAccent, ),
                            ),
                            child: const Text("Log In",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Text("If you are new, please ",
                        style: TextStyle(color: Colors.white)),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      ),
                      child: const Text(
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
