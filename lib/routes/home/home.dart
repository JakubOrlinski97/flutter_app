import 'package:flutter/material.dart';
import 'package:flutter_app/components/RecentlyPlayed/RecentlyPlayed.dart';
import 'package:flutter_app/components/Song/Playback.dart';
import 'package:flutter_app/components/Song/PlayingBottomSheet.dart';
import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/MediaPlayer.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget getBottomSheet(
      {double sliderValue,
      PlayerState playerState,
      Song currentSong,
      dynamic play,
      dynamic pause}) {
    return PlayingBottomSheet(
        sliderValue: sliderValue,
        playerState: playerState,
        currentSong: currentSong,
        play: play,
        pause: pause);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library"),
      ),
      body: RecentlyPlayed(),
      bottomSheet: PlayBack(
        child: getBottomSheet,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey.shade100,
        unselectedItemColor: Colors.grey.shade500,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.search),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(Icons.library_music),
            ),
            label: 'Library',
          )
        ],
      ),
    );
  }
}
