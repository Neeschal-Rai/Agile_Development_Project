import 'package:flutter/material.dart';
class ChooseUploadScreen extends StatefulWidget {
  const ChooseUploadScreen({Key? key}) : super(key: key);

  @override
  _ChooseUploadScreenState createState() => _ChooseUploadScreenState();
}

class _ChooseUploadScreenState extends State<ChooseUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              const Text("ChOOSE UPLOAD METHOD",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),

                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("upload single",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                        Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("upload album",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(
                        Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
