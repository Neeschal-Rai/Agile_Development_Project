import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dhun/constraints/constraints.dart';
import 'package:dhun/constraints/userdata.dart';
import 'package:dhun/screens/homepagescreen.dart';
import 'package:dhun/screens/libraryscreen.dart';
import 'package:dhun/services/AddToFavoriteServices.dart';
import 'package:dhun/services/GetSelectedSongServices.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lyricsscreen.dart';

class MusicScreen extends StatefulWidget {
  final String id;

  const MusicScreen({required this.id});

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache = AudioCache();
  // String filePath =
  //     'http://192.168.1.69:90/1644167458810Y2Mate.is%20-%20Mohani%20Lagla%20Hai%20%20Nepali%20Movie%20Chino%20Song%20%20Narayan%20Gopal,%20Asha%20Bhosle%20%20Shiva%20Shrestha,%20Bhuwan%20KC-pzcBs8XrvyQ-160k-1643369128002.mp3';
  String filePath =
      'http://172.25.1.125%3A90/1644580967815Y2Mate.is%20-%20Mohani%20Lagla%20Hai%20%20Nepali%20Movie%20Chino%20Song%20%20Narayan%20Gopal%2C%20Asha%20Bhosle%20%20Shiva%20Shrestha%2C%20Bhuwan%20KC-pzcBs8XrvyQ-160k-1643369128002.mp3';
  bool isPressed = false;
  String url = "";

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;
  String song_id = "";

  getselectedsong() async {
    try {
      var getServices = GetSelectedSongServices();
      print(widget.id);
      var response = await getServices.getsong(widget.id);
      return response;
    } catch (e) {
      print(e);
    }
  }

  addtofavorites() async {
    try {
      var body = {
        "songid": widget.id,
      };
      var addtofavServices = AddToFavoriteServices();
      var response = await addtofavServices.addtofavorites(user_id_login, body);
      return response;
    } catch (e) {
      print(e);
    }
  }

  /// Optional
  Widget slider() {
    return Container(
      width: 400.0,
      child: Slider.adaptive(
          value: (timeProgress / 1000).roundToDouble(),
          max: (audioDuration / 1000).floorToDouble(),
          activeColor: Colors.white,
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  @override
  void initState() {
    super.initState();

    /// Compulsory
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });

    /// Optional
    audioPlayer.onAudioPositionChanged.listen((Duration p) async {
      setState(() {
        timeProgress = p.inMilliseconds;
      });
    });
  }

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    print(filePath);
    await audioPlayer.play(filePath);
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
  }

  loopMusic() async {
    await audioCache.loop(filePath);
  }

  /// Optional
  Future<int> _getAudioDuration() async {
    File audioFile = await audioCache.load(filePath);
    await audioPlayer.setUrl(
      audioFile.path,
    );

    audioDuration = await Future.delayed(
      Duration(seconds: 2),
      () => audioPlayer.getDuration(),
    );

    return audioDuration;
  }

  /// Optional
  Widget getLocalFileDuration() {
    return FutureBuilder<int>(
      future: _getAudioDuration(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('No Connection...');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Text('Waiting...');
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Text(getTimeString(snapshot.data!));
        }
      },
    );
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

  /// Optional
  String getTimeString(int milliseconds) {
    if (milliseconds == null) milliseconds = 0;
    String minutes =
        '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds =
        '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60}';
    return '$minutes:$seconds'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF8E24AA),
                      Color(0xFF7B1FA2),
                      Color(0xFF6A1B9A),
                      Color(0XFF4A148C),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
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
                            padding: EdgeInsets.only(top: 20.0, left: 70),
                            child: Text("NOW PLAYING",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 24.0,
                          ),
                          FutureBuilder(
                            future: getselectedsong(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                dynamic data = jsonDecode(jsonDecode(
                                    snapshot.data.toString()))["data"];
                                print(data);

                                // filePath = BASE_URL + '${data[0]["song_file"]}';
                                // url = BASE_URL + '${data[0]["song_lyrics"]}';
                                print(filePath);
                                return Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //Let's add the music cover
                                      Center(
                                        child: Container(
                                          width: 280.0,
                                          height: 300.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(BASE_URL +
                                                      data[0]["song_image"]),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(data[0]["song_name"],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(data[0]["song_artist"],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const SizedBox(
                                        height: 40.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(top: 0.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              //Let's start by adding the controller
                                              //let's add the time indicator tex
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [

                                                  IconButton(
                                                    iconSize: 45.0,
                                                    color: Colors.white,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.skip_previous,
                                                    ),
                                                  ),
                                                  IconButton(
                                                      iconSize: 50,
                                                      color: Colors.white,
                                                      onPressed: () {
                                                        audioPlayerState ==
                                                                AudioPlayerState
                                                                    .PLAYING
                                                            ? pauseMusic()
                                                            : playMusic();
                                                        setState(() {});
                                                      },
                                                      icon: Icon(audioPlayerState ==
                                                              AudioPlayerState
                                                                  .PLAYING
                                                          ? Icons.pause_rounded
                                                          : Icons
                                                              .play_arrow_rounded)),
                                                  IconButton(
                                                    iconSize: 45.0,
                                                    color: Colors.white,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.skip_next,
                                                    ),
                                                  ),

                                                  IconButton(
                                                    iconSize: 25.0,
                                                    color: Colors.white,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.loop,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getTimeString(timeProgress),
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  SizedBox(
                                                      width: 200,
                                                      child: slider()),
                                                  const SizedBox(width: 20),
                                                  audioDuration == 0
                                                      ? getLocalFileDuration()
                                                      : Text(getTimeString(
                                                          audioDuration))
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconButton(
                                                      iconSize: 30.0,
                                                      color: (isPressed)
                                                          ? const Color(
                                                              0xFFFF0000)
                                                          : const Color(
                                                              0xFFFFFFFF),
                                                      onPressed: () async {
                                                        setState(() {
                                                          isPressed = true;
                                                        });
                                                        var response = json.decode(
                                                            await addtofavorites());
                                                        print(response);
                                                        if (response[
                                                                "success"] ==
                                                            true) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Added successfully',
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .BOTTOM,
                                                              timeInSecForIosWeb:
                                                                  1,
                                                              backgroundColor:
                                                                  Colors
                                                                      .deepPurple,
                                                              textColor:
                                                                  Colors.white);
                                                        }
                                                        if (response[
                                                        "success"] ==
                                                            false) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                              'Already added to favorite',
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                              ToastGravity
                                                                  .BOTTOM,
                                                              timeInSecForIosWeb:
                                                              1,
                                                              backgroundColor:
                                                              Colors
                                                                  .deepPurple,
                                                              textColor:
                                                              Colors.white);
                                                        }
                                                      },
                                                      icon: const Icon(
                                                        Icons.favorite,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize: 30.0,
                                                      color: Colors.white,
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.shuffle,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize: 30.0,
                                                      color: Colors.white,
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const HomeScreen(index: 2)));
                                                      },
                                                      icon: const Icon(
                                                        Icons.playlist_play,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      iconSize: 30.0,
                                                      color: Colors.white,
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    LyricsScreen(
                                                                        url:
                                                                            url)));
                                                      },
                                                      icon: const Icon(
                                                        Icons.note,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: Text(
                                  'Error occured',
                                  textScaleFactor: 3,
                                  style: TextStyle(color: Colors.white),
                                ));
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
