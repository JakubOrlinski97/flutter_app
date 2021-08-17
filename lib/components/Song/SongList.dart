import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Song/SongItem.dart';
import 'package:flutter_app/models/Database.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:provider/provider.dart';

class SongList extends StatefulWidget {
  SongList({Key key, this.playlist}) : super(key: key);

  final Playlist playlist;

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    if (!(widget.playlist.songs is List)) {
      return Text("not list");
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.playlist.songs.length,
        itemBuilder: (context, index) {
          Song song = widget.playlist.songs[index];
          return StreamProvider.value(
            value: Database().getSong(song.songRef),
            initialData: null,
            child: SongItem(
                song: widget.playlist.songs[index], playlist: widget.playlist),
          );
        });
  }
}
