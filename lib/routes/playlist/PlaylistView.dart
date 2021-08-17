import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Song/Playback.dart';
import 'package:flutter_app/components/Song/PlayingBottomSheet.dart';
import 'package:flutter_app/components/Song/SongList.dart';
import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/MediaPlayer.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/PlaylistType.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class PlaylistView extends StatefulWidget {
  PlaylistView({Key key}) : super(key: key);

  @override
  _PlaylistViewState createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  Store<AppState> store;
  Playlist playlist;

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
    this.playlist = ModalRoute.of(context).settings.arguments as Playlist;

    return Scaffold(
      bottomSheet: PlayBack(child: getBottomSheet),
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50, child: BackButton()),
                  Hero(
                    tag: 'hero-rectangle-${playlist.reference.id}',
                    child: SizedBox(
                        width: 250,
                        height: 250,
                        child: CachedNetworkImage(imageUrl: playlist.coverUrl)),
                  ),
                  SizedBox(width: 50, child: Container()),
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(playlist.name,
                      style: Theme.of(context).textTheme.headline4),
                  Text(playlist.author,
                      style: Theme.of(context).textTheme.headline5),
                  Row(children: [
                    Text(playlist.playlistType.parseType,
                        style: Theme.of(context).textTheme.headline6),
                    Text(" - "),
                    Text(playlist.releaseYear.year.toString(),
                        style: Theme.of(context).textTheme.headline6)
                  ])
                ],
              ),
            ),
            SongList(playlist: playlist),
          ],
        ),
      )),
    );
  }
}
