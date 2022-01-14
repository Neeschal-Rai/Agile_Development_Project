import 'dart:convert';

import 'package:dhun/component/Model/Song.dart';
import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/screens/libraryscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final songnameController = TextEditingController();
  Future register() async {
    var res =
        await http.post(Uri.parse(getUploadSong), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8'
    }, body: <String, String>{
      'song_name': song.song_name,
      'song_artist': song.song_artist,
      'song_image': song.song_image,
      'song_file': song.song_file
    });
    dynamic body = jsonDecode(res.body);
    if (body["success"] == true) {
      Fluttertoast.showToast(
          msg: 'Upload successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurple,
          textColor: Colors.white);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LibraryScreen()),
      );
    } else {
      print("False credentials");
    }
  }
  Song song = Song("", "", "", "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
       child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.003, 3],
            colors: [
              Colors.deepPurple,
              Colors.black,
            ],
          )),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text('Upload your music',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Song Name",
                              style: TextStyle(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: songnameController,
                            onChanged: (value) {
                              song.song_name = value;
                            },
                            decoration: new InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Song Artist",
                              style: TextStyle(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: songnameController,
                            onChanged: (value) {
                              song.song_name = value;
                            },
                            decoration: new InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Song Image",
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              final result =
                                  await FilePicker.platform.pickFiles();
                              if (result == null) {
                                return;
                              }
                              final file = result.files.first;
                              openFile(file);
                            },
                            child: Text("Choose file")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Song Image",
                              style: TextStyle(color: Colors.white)),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              final result =
                                  await FilePicker.platform.pickFiles();
                              if (result == null) {
                                return;
                              }
                              final file = result.files.first;
                              openFile(file);
                            },
                            child: Text("Choose file"))
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LibraryScreen()),
                      );
                    },
                    child: Text("Upload",style: TextStyle(
                    color: Colors.white, backgroundColor: Colors.deepPurple)))
              ],
            ),
          )),
    ));
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
