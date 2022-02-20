import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class LyricsScreen extends StatefulWidget {
  final String url;
  const LyricsScreen({required this.url});


  @override
  _LyricsScreenState createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  List<String> _lyricslist=[];
  Future<List<String>> _loadsonglyrics() async {
    LineSplitter ls = new LineSplitter();
    _lyricslist = ls.convert(await http.read(Uri.parse(widget.url)));
    print(_lyricslist);
    return _lyricslist;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
             Expanded(
               child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 70),
                          child: Text("SONG LYRICS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _loadsonglyrics(),
                      builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                        print(snapshot.data);
                        if(snapshot.hasData) {
                          return ListView.builder(
                            itemCount: _lyricslist.length,
                            itemBuilder: (context, index) {
                              return Text(_lyricslist[index],
                                  style: const TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 22));
                            },
                          );
                        }else{
                          return const Center(
                              child: Text(
                                'No lyrics found',
                                textScaleFactor: 3,
                                style: TextStyle(color: Colors.red),
                              ));
                        }

                      }
                    ),
                  ),
                ],
            ),
             ),
          ]),
        ),
      ));

  }
}
