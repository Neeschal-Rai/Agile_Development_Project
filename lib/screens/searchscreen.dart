import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
             child: Column(
               children: [
                 SizedBox(
                   height: 30,
                 ),
                Text("WELCOME RUBY",
                       style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                           fontWeight: FontWeight.bold)),
                 SizedBox(
                   height: 30,
                 ),

                 Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius:  BorderRadius.circular(20),
                   ),
                   child: TextField(
                     decoration: InputDecoration(
                       hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                       hintText: 'Search songs',
                       suffixIcon: Icon(Icons.search,
                       color: Colors.deepPurple,),
                       border: InputBorder.none,
                       contentPadding: EdgeInsets.all(20),
                     ),
                   ),
                 ),
               ],
             ),
          ),
        )
    );
  }
}
