import 'package:flutter/material.dart';
import 'package:flutter_app/components/Song/SongItem.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/Song.dart';

class SongList extends StatefulWidget {
  SongList({Key key, this.playlist}) : super(key: key);

  final Playlist playlist;

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children:
            widget.playlist.songs.map((song) => SongItem(song: song)).toList());
  }
}
