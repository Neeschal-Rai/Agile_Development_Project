import 'dart:convert';

import 'package:dhun/component/Model/Song.dart';
import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/screens/libraryscreen.dart';
import 'package:dhun/services/UploadSongServices.dart';
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
  final artistnameController = TextEditingController();
  final songdescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String song_name = "";
  String artist_name = "";
  String song_desc = "";


  postData() async {
    try{
      var body = {
        "song_name":song_name,
        "artist_name":artist_name,
        "song_desc":song_desc,
      };

      var userServices = UploadSongServices();
      var response = await userServices.uploadsong(body);
      return response;
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Song Name",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: songnameController,
                                onChanged: (value) {
                                  song_name = value;
                                },
                                decoration: new InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
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
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: artistnameController,
                                onChanged: (value) {
                                  artist_name = value;
                                },
                                decoration: new InputDecoration(
                                  enabledBorder: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Song Description",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              height: 5 * 24.0,
                              child: TextField(
                                maxLines: 5,
                                controller: songdescController,
                                onChanged: (value) {
                                  song_desc = value;
                                },
                                style:
                                    TextStyle(fontSize: 18, color: Colors.white),
                                decoration: InputDecoration(
                                  fillColor: Colors.deepPurple,
                                  filled: true,
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
                              child: Text("Song file",
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
                    child: Text("Upload",
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.deepPurple)))
              ],
            ),
          ),
        ));
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}
