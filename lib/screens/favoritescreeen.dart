import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(

          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10),
                    child: Text('Liked songs',
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  IconButton(
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('105 songs',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      margin: const EdgeInsets.only(top: 30.0),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mohani lagla hai',
                                      style: TextStyle(
                                          color: Colors.deepPurpleAccent,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('Dambar Nepali',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.black),
                        color: Colors.black,
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset("assets/images/sabinrai.jpg",
                                  height: 80, width: 80, fit: BoxFit.contain),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('xyv',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('A',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 180.0),
                              child: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),



                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
