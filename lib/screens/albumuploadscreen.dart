import 'dart:convert';
import 'dart:io';

import 'package:dhun/services/NotificationServices.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

class AlbumUploadScreen extends StatefulWidget {
  const AlbumUploadScreen({Key? key}) : super(key: key);

  @override
  _AlbumUploadScreenState createState() => _AlbumUploadScreenState();
}

class _AlbumUploadScreenState extends State<AlbumUploadScreen> {
  final AlbumnameController = TextEditingController();
  final AlbumdescController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    NotificationService().requestPermission();
  }

  String Album_name = "";
  String Album_desc = "";
  File? imageFile;

  PlatformFile? musicFile;

  uploadAlbumData() async {
    try {
      var body = {
        "Album_name": Album_name,
        "Album_desc": Album_desc,
        "image": imageFile,
        "Album": musicFile,
      };
      print(body);

      // var userServices = UploadAlbumServices();
      // var response = await userServices.uploadAlbum(body);
      // return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: IconButton(
                      iconSize: 20.0,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 100),
                      child: Image.asset("assets/images/musical-note.png",
                          height: 50, width: 50, fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 100),
                  child: Text("Upload your album",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
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
                            child: Text("Album Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              controller: AlbumnameController,
                              onChanged: (value) {
                                Album_name = value;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is required';
                                }
                              },
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 3),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Album Description",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 5 * 24.0,
                            child: TextField(
                              maxLines: 5,
                              controller: AlbumdescController,
                              onChanged: (value) {
                                Album_desc = value;
                              },
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2)),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Album Image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
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
                            )
                          else
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("*Required",
                                  style: TextStyle(color: Colors.red)),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () => openAlbumImage(),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: const Text(
                                  "Choose Image",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Album file",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
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
                            )
                          else
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text("*Required",
                                  style: TextStyle(color: Colors.red)),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () => openMusicFile(),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                child: const Text("Choose file", style: TextStyle(color:Colors.deepPurple,fontWeight: FontWeight.bold),)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.white),
                    ),
                    onPressed: () async {
                      var notification = NotificationService().showNotification(
                        1,
                        'main_channel',
                        'New Album',
                        'New Album added',
                      );
                      print(jsonDecode(jsonDecode(notification.toString())));
                      // if (_formKey.currentState!.validate()) {
                      //   var response = await uploadAlbumData();
                      //   var res = json.decode(response);
                      //   print(res["success"]);
                      //
                      //   if (res["success"] == true) {
                      //     var notification =
                      //     NotificationService().showNotification(
                      //       1,
                      //       'main_channel',
                      //       'New Album',
                      //       'New Album added',
                      //     );
                      //     print(notification);
                      //     Navigator.pop(context);
                      //     Fluttertoast.showToast(
                      //         msg: 'Album uploaded',
                      //         toastLength: Toast.LENGTH_SHORT,
                      //         gravity: ToastGravity.BOTTOM,
                      //         timeInSecForIosWeb: 1,
                      //         backgroundColor: Colors.deepPurple,
                      //         textColor: Colors.white);
                      //   }
                      //
                      //   if (res["success"] == false) {
                      //     Fluttertoast.showToast(
                      //         msg: 'Invalid.Please try again!',
                      //         toastLength: Toast.LENGTH_SHORT,
                      //         gravity: ToastGravity.BOTTOM,
                      //         timeInSecForIosWeb: 1,
                      //         backgroundColor: Colors.deepPurple,
                      //         textColor: Colors.white);
                      //   }
                      // }

                    },
                    child: const Text("Upload",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 16, fontWeight: FontWeight.bold))),
              )
            ],
          ),
        ));
  }

  void openAlbumImage() async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    print(picture?.path);
    if (picture?.path != null) {
      setState(() {
        imageFile = File(picture!.path);
      });
    }
  }

  void openMusicFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    print(result?.files.first);
    if (result != null) {
      setState(() {
        musicFile = result.files.first;
      });
    }
  }
}
