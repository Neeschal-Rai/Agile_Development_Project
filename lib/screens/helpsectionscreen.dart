import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
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
              "How can we Help you?",
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
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account Help",
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
                  Text("Can't remember login details",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        "If you don't remember your password use password reset."
                            "If you don't remember your email or username, go to password reset and enter possible email addresses you own."
                            "When you enter an email that's registered with Dhun, you get the message that password reset email was sent.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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
                  Text("Can't reset password",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        'You need access to the email address on your Dhun account to open the password reset link we email you.'
                            "If you don't have access, create a new account and start fresh.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
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
                  Text('How to log out',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        'Tap home, go to profile screen then scroll to the bottom and tap Logout.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
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
                  Text('How to delete account permanently',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        'Tap home, go to profile screen then scroll to the bottom and tap Delete my account.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 8,
                ),
                Text(
                  "App Help",
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
                  Text('What is Dhun?',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        'Dhun is a digital music service that gives you access to listen songs from creators all over the world.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
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
                  Text('Getting started',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        'First create an account by signing up from login screen in the app.'
                            ' Provide user/artist signup details.'
                            ' Then explore, discover and listen tons of music.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
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
                  Text('Your Library',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        'You can save anything you like in Your Library for quick access.'
                            " When you press the favorite icon on an album or artist, it doesn't automatically like all the songs. Also, liking a song doesn't automatically like the album or artist.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
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
                  Text('Dhun for artist',
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text(
                        " Making music? Dhun for Artists lets you manage your artist profile, promote your music and get to know your audience/fans count. ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    " Have your Questions?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text('Contact us at dhun@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
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
