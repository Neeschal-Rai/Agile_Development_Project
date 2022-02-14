import 'dart:convert';

import 'package:dhun/component/Model/User.dart';
import 'package:dhun/screens/loginscreen.dart';
import 'package:dhun/screens/otpscreen.dart';
import 'package:dhun/services/RegisterServices.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final items = ["User", "Artist"];
  String? value;
  bool _isObscure = true;
  bool submitValid = false;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late EmailAuth emailAuth;

  late Map<String, String> map;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = EmailAuth(
      sessionName: "Sample session",
    );


  }
  String username = "";
  String email = "";
  String password = "";
  String usertype = "";

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: email, otpLength: 4);
    if (result) {
      setState(() {
        submitValid = true;
      });
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
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text("Create an account",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset("assets/images/logo.png",
                        height: 200, width: 200, fit: BoxFit.contain),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Email Address",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:4,top: 8.0),
                      child: TextFormField(
                        key: const Key("emailfield"),
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email address is required';
                          } else if (RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return null;
                          } else {
                            return 'Enter valid email address';
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left:5.0, right: 5, top: 40),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  const BorderSide(color: Colors.white, width: 1)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.deepPurpleAccent, width: 6))
                        ),

                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Username",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left:4,top: 8.0),
                      child: TextFormField(
                        key: const Key("usernamefield"),
                        style: const TextStyle(color: Colors.white),
                        controller: nameController,
                        onChanged: (value) {
                          username = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username is required';
                          } else if (value.length > 8) {
                            return null;
                          } else {
                            return 'Username length must be greater than 8';
                          }
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left:5.0, right: 5, top: 40),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                const BorderSide(color: Colors.white, width: 1)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Colors.deepPurpleAccent, width: 6))
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Usertype",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8,top: 8.0, bottom: 8.0),
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              key: const Key("usertypefield"),
                              value: value,
                              iconSize: 20,
                              dropdownColor: Colors.black,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.deepPurple, size: 30),
                              isExpanded: true,
                              items: items.map(buildMenuItem).toList(),
                              onChanged: (value) => {
                                    print(value),
                                    setState(() => {this.value = value!}),
                                  }),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Password",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8),
                      child: TextFormField(
                        key: const Key("passwordfield"),
                        style: TextStyle(color: Colors.white),
                        controller: passwordController,
                        obscureText: _isObscure,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          }
                          else if (value.length > 8) {
                            return null;
                          } else {
                            return 'Password length must be greater than 8';
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left:5.0, right: 5, top: 40),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
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
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Confirm Password",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8),
                      child: TextFormField(
                        key: const Key("cpasswordfield"),
                        style: const TextStyle(color: Colors.white),
                        controller: confirmPasswordController,
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "this field is required";
                          }else if(value!=password){
                            return "password didnot match!";
                          }
                          else if (value.length > 8) {
                            return null;
                          } else {
                            return 'Password length must be greater than 8';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left:5.0, right: 5, top: 40),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.deepPurpleAccent, width: 6)),
                        ),
                      ),
                    ),
                  ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          ElevatedButton(
                            key: const Key("registerbutton"),
                              onPressed: () async {

                                if (_formKey.currentState!.validate()) {
                                  map = {
                                    "username": username,
                                    "email": email,
                                    "password": password,
                                    "usertype": value!,
                                  };
                                  sendOtp();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OTPScreen(receivedMap: map,emailAuth: emailAuth,)));


                                } else {
                                  print("Error");
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.deepPurpleAccent, ),
                              ),
                              child: const Text("Register",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),

                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Already have an account ",
                          style: TextStyle(color: Colors.white)),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        ),
                        child: Text("Login here.",
                            style: TextStyle(
                              color: Colors.red.withOpacity(0.8),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(color: Colors.deepPurpleAccent),
      ));
}
