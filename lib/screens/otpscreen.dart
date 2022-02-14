import 'dart:convert';

import 'package:dhun/screens/loginscreen.dart';
import 'package:dhun/screens/registerscreen.dart';
import 'package:dhun/services/RegisterServices.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OTPScreen extends StatefulWidget {
  final Map<String, String> receivedMap;
  final EmailAuth emailAuth;
  const OTPScreen({required this.receivedMap, required this.emailAuth});


  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();


  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;
  @override
  void initState() {
    super.initState();
    // Initialize the package
    print(widget.receivedMap);
    print(widget.emailAuth);

  }

  bool verify() {
    bool res = widget.emailAuth.validateOtp(
        recipientMail: widget.receivedMap["email"].toString(),
        userOtp: _otp!);

    return res;

  }





  postData() async {
    try {

      var loginServices = RegisterServices();
      var response = await loginServices.Register(widget.receivedMap);
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Email Address Verification', style: TextStyle(color: Colors.white),),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_fieldOne, true),
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false),
              OtpInput(_fieldFive, false),
              OtpInput(_fieldSix, false)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async{
                setState(() {
                  _otp = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text+_fieldFive.text+_fieldSix.text;
                });
                if(verify()){
                  var response = await postData();
                  var res = json.decode(response);

                  if (res["success"] == true) {
                    Fluttertoast.showToast(
                        msg: 'Registered successfully',
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
                                LoginScreen()));
                  }else{
                    Fluttertoast.showToast(
                        msg: 'Registration unsuccessful!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white);
                  }

                }else{
                  Fluttertoast.showToast(
                      msg: 'Pin invalid',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.deepPurple,
                      textColor: Colors.white);

                }

              },
              child: const Text('Submit')),
          const SizedBox(
            height: 30,
          ),
          // Display the entered OTP code
          Text(
            _otp ?? 'Please enter OTP',
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration:  InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                const BorderSide(color: Colors.white, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                const BorderSide(color: Colors.white, width: 1)),
            counterText: '',
            hintStyle: TextStyle(color: Colors.white, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
}}
