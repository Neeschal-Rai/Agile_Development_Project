import 'dart:convert';

import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/services/GetAllArtistDataServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ArtistScreeen extends StatefulWidget {
  const ArtistScreeen({Key? key}) : super(key: key);

  @override
  _ArtistScreeenState createState() => _ArtistScreeenState();
}

class _ArtistScreeenState extends State<ArtistScreeen> {
  getartistData() async {
    try {
      var getartistServices = GetAllArtistDataServices();
      var response = await getartistServices.getartists();
      return response;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 115,
                ),
                const Center(
                  child: Text(
                    "Artists",
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
              Expanded(
                child: FutureBuilder(
                  future: getartistData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    dynamic data = jsonDecode(
                        jsonDecode(snapshot.data.toString()))["data"];
                    print(data);
                    if (data.isEmpty != true) {
                      return SizedBox(
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                                color: Colors.black,
                            elevation: 5.0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Container(
                              child: Column(
                                children: [
                              Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0),
                              width: 200,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(BASE_URL +
                                          data[index]["profilepic"]),
                                      fit: BoxFit.cover)),
                            ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(data[index]["username"],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  ElevatedButton(
                                      onPressed: () async {
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.deepPurpleAccent),
                                      ),
                                      child: const Text("Follow",
                                          style: TextStyle(color: Colors.white))),
                                ],
                              ),

                              // ),
                            ),
                          ),
                          staggeredTileBuilder: (int index) =>
                              StaggeredTile.count(2, index.isEven ? 3 : 3),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                        // child: ListView.builder(
                        //     itemCount: 2,
                        //     scrollDirection: Axis.vertical,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       int newindex=0;
                        //       if (index>0){
                        //         print(index);
                        //        newindex=index+2;
                        //       }
                        //       print(newindex);
                        //       return Padding(
                        //         padding: const EdgeInsets.only(
                        //             top: 20, left: 20, right: 20),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Card(
                        //               color: Colors.black,
                        //               child: Column(
                        //                 children: [
                        //                   ClipRRect(
                        //                     borderRadius:
                        //                         BorderRadius.circular(100),
                        //                     child: Image.asset(
                        //                         "assets/images/download.jpg",
                        //                         height: 150,
                        //                         width: 150,
                        //                         fit: BoxFit.cover),
                        //                   ),
                        //                   const SizedBox(
                        //                     height: 10,
                        //                   ),
                        //                   Text(data[newindex]["username"],
                        //                       style: const TextStyle(
                        //                           color: Colors.white))
                        //
                        //                 ],
                        //               ),
                        //             ),
                        //             Card(
                        //               color: Colors.black,
                        //               child: Column(
                        //                 children: [
                        //                   ClipRRect(
                        //                     borderRadius:
                        //                         BorderRadius.circular(100),
                        //                     child: Image.asset(
                        //                         "assets/images/download.jpg",
                        //                         height: 150,
                        //                         width: 150,
                        //                         fit: BoxFit.cover),
                        //                   ),
                        //                   const SizedBox(
                        //                     height: 10,
                        //                   ),
                        //                   Text(data[newindex+1]["username"],
                        //                       style: const TextStyle(
                        //                           color: Colors.white))
                        //
                        //                 ],
                        //               ),
                        //             ),
                        //
                        //
                        //           ],
                        //         ),
                        //       );
                        //
                        //
                        //     }
                        //     ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              )
            ],
          ),
        )));
  }
}
