import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Playlist/PlaylistItem.dart';
import 'package:flutter_app/components/SidewaysList/SidewaysList.dart';
import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/store/playlists/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class RecentlyPlayed extends StatefulWidget {
  RecentlyPlayed({Key key}) : super(key: key);

  @override
  _RecentlyPlayedState createState() => _RecentlyPlayedState();
}

class _RecentlyPlayedState extends State<RecentlyPlayed> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference playlistRef =
        FirebaseFirestore.instance.collection('playlists');

    return StoreConnector<AppState, List<Playlist>>(
      converter: (store) => store.state.playlists,
      builder: (context, List<Playlist> playlists) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: StreamBuilder(
                stream: playlistRef.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return SidewaysList(
                        title: "Recently played",
                        children: snapshot.data.docs.map((pl) {
                          return PlaylistItem(
                              playlist: Playlist.fromSnapshot(pl),
                              isLoading: isLoading);
                        }).toList());
                  } else {
                    return CircularProgressIndicator();
                  }
                }));
      },
    );
  }
}
