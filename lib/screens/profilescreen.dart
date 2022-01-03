import 'package:dhun/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('My Profile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('@rubytorubs',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text('rubytorubs@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: null,
                        child: Text("Edit",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Following',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('Followers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('14',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('0',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: 380,
                      height: 215,
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, bottom: 10),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                ),
                                child: Text(
                                  "Notifications",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, bottom: 10),
                              child: Text('Settings',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, bottom: 10),
                              child: Text('Help section',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 20, bottom: 10),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                ),
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        )
        //
        );
  }
}
