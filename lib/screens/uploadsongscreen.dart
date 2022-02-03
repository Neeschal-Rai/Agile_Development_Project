import 'dart:convert';
import 'dart:io';

import 'package:dhun/screens/homepagescreen.dart';
import 'package:dhun/screens/libraryscreen.dart';
import 'package:dhun/services/NotificationServices.dart';
import 'package:dhun/services/UploadSongServices.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;

class UploadSongScreen extends StatefulWidget {
  const UploadSongScreen({Key? key}) : super(key: key);

  @override
  _UploadSongScreenState createState() => _UploadSongScreenState();
}

class _UploadSongScreenState extends State<UploadSongScreen> {
  final songnameController = TextEditingController();
  final artistnameController = TextEditingController();
  final songdescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    NotificationService().requestPermission();
  }


  String song_name = "";
  String artist_name = "";
  String song_desc = "";
  File? imageFile;
  PlatformFile? musicFile;


  uploadsongData() async {
    try {
      var body = {
        "song_name": song_name,
        "artist_name": artist_name,
        "song_desc": song_desc,
        "image": imageFile,
        "song": musicFile,
      };
      print(body);

      var userServices = UploadSongServices();
      var response = await userServices.uploadsong(body);
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text('Upload your music',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Song Name",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: songnameController,
                                onChanged: (value) {
                                  song_name = value;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Song Artist",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: artistnameController,
                                onChanged: (value) {
                                  artist_name = value;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
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
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Song Image",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            if (imageFile != null)
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(imageFile!)),
                                ),
                              ),
                            ElevatedButton(
                                onPressed: () => openSongImage(),
                                child: const Text("Choose Image")),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Song file",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            if (musicFile != null)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${musicFile?.name}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                            ElevatedButton(
                                onPressed: () => openMusicFile(),
                                child: const Text("Choose file"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      NotificationService().showNotification(
                        1,
                        'main_channel',
                        'New song',
                        'Uploaded',
                      );

                      var response = await uploadsongData();
                      var res = json.decode(response);
                      print(res["success"]);
                      if (res["success"] == true) {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                            msg: 'Song uploaded',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.deepPurple,
                            textColor: Colors.white);
                      }
                    },
                    child: const Text("Upload",
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

  void openSongImage() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(picture?.path);
    if (picture?.path != null) {
      setState(() {
        imageFile = File(picture!.path);
      });
    }
  }

  void openMusicFile() async {
    final result = await FilePicker.platform.pickFiles();
    OpenFile.open(result?.files.first.path);
    print(result?.files.first);
    if (result != null) {
      setState(() {
        musicFile = result.files.first;
      });
    }
  }
}
