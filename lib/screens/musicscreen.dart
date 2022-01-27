import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache = AudioCache();
  String filePath = 'music/another.mp3';

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  /// Optional
  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          value: (timeProgress / 1000).floorToDouble(),
          max: (audioDuration / 1000).floorToDouble(),
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
    await audioCache.play(filePath);
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
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
            return Text('No Connection...');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Waiting...');
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
                  stops: [0.003, 3],
                  colors: [
                    Colors.deepPurple,
                    Colors.black,
                  ],
                )),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text("NOW PLAYING",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    //Let's add the music cover
                    Center(
                      child: Container(
                        width: 280.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: AssetImage("assets/images/sabinrai.jpg"),
                            )),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text("Hamro Nepal ma",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text("Neetesh Jung Kunwar",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 0.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //Let's start by adding the controller
                            //let's add the time indicator tex
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  iconSize: 45.0,
                                  color: Colors.black,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.skip_previous,
                                  ),
                                ),
                                IconButton(
                                    iconSize: 50,
                                    color: Colors.black,
                                    onPressed: () {
                                      audioPlayerState ==
                                              AudioPlayerState.PLAYING
                                          ? pauseMusic()
                                          : playMusic();
                                      setState(() {});
                                    },
                                    icon: Icon(audioPlayerState ==
                                            AudioPlayerState.PLAYING
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded)),
                                IconButton(
                                  iconSize: 45.0,
                                  color: Colors.black,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.skip_next,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(getTimeString(timeProgress)),
                                SizedBox(width: 20),
                                Container(width: 200, child: slider()),
                                SizedBox(width: 20),
                                audioDuration == 0
                                    ? getLocalFileDuration()
                                    : Text(getTimeString(audioDuration))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    iconSize: 30.0,
                                    color: Colors.black,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                    ),
                                  ),
                                  IconButton(
                                    iconSize: 30.0,
                                    color: Colors.black,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.shuffle,
                                    ),
                                  ),
                                  IconButton(
                                    iconSize: 30.0,
                                    color: Colors.black,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.menu,
                                    ),
                                  ),
                                  IconButton(
                                    iconSize: 30.0,
                                    color: Colors.black,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_vert,
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
                ))));
  }
}
