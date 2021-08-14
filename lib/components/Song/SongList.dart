import 'package:cloud_firestore/cloud_firestore.dart';
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
    DocumentReference<Map<String, dynamic>> songRef = FirebaseFirestore.instance
        .collection('playlists')
        .doc(widget.playlist.reference.id);

    return StreamBuilder(
        stream: songRef.collection("songs").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          print("builder ${snapshot.data} ${snapshot.hasData}");

          if (snapshot.hasData) {
            print("song.fromSnapshot ${snapshot.data.docs}");

            return ListView(
                shrinkWrap: true,
                children: snapshot.data.docs.map((song) {
                  return SongItem(
                      song: Song.fromSnapshot(song), playlist: widget.playlist);
                }).toList());
          } else {
            return Text("Nothing");
          }
        });
  }
}
