import 'package:dhun/screens/homepage.dart';
import 'package:dhun/screens/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Container(
                  child: Image.asset("assets/images/logos.png", height: 200, width: 200, fit: BoxFit.contain),
                ),
                SizedBox(height: 100,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email Address", style : TextStyle(color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextFormField(
                          style : TextStyle(color: Colors.white),
                          controller: emailController,
                          decoration: new InputDecoration(

                            enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(15),
                                borderSide: new BorderSide(
                                    color: Colors.white
                                )
                          ),

                        ),
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password", style : TextStyle(color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(

                      style : TextStyle(color: Colors.white),
                      controller: passwordController,
                      obscureText: _isObscure,
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
                            borderSide: new BorderSide(
                                color: Colors.white
                            )
                        ),

                      ),
                    ),
                  ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      ), child: Text(
                        "Log In"
                      )),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Text("If you are new, please ", style : TextStyle(color: Colors.white)),
                    InkWell(
                      onTap: ()=>Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterScreen()),
                              ),
                      child: Text("Register here.", style: TextStyle(
                        color: Colors.lightBlue.withOpacity(0.8)
                      ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
