import 'package:flutter/material.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            const Text(
              "Settings",
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
                Icon(
                  Icons.person,
                  color: Colors.deepPurple,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
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
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("Change Password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),

                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("close"),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.lock_open,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Change Password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Option 1"),
                            Text("Option 2"),
                            Text("Option 3"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("close"),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.privacy_tip_sharp,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Privacy',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.deepPurple,
                        title: Text("Change Password"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Security"),
                          ]
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("close"),
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.security_sharp,
                    color: Colors.deepPurple,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Security',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.deepPurple,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              children: const [
                Icon(
                  Icons.info,
                  color: Colors.deepPurple,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "About",
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
                  Text('Version',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text('8.65.7.1240',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
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
                  Text('Terms and Conditions',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text('All the stuff you need to know',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
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
                  Text('Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 2,
                    ),
                    child: Text('Your personal information protection',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.normal)),
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
