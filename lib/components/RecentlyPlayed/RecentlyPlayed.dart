import 'package:flutter/material.dart';
import 'package:flutter_app/components/Playlist/PlaylistItem.dart';
import 'package:flutter_app/components/SidewaysList/SidewaysList.dart';
import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RecentlyPlayed extends StatefulWidget {
  RecentlyPlayed({Key key}) : super(key: key);

  @override
  _RecentlyPlayedState createState() => _RecentlyPlayedState();
}

class _RecentlyPlayedState extends State<RecentlyPlayed> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Playlist>>(
      converter: (store) => store.state.playlists,
      builder: (context, List<Playlist> playlists) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SidewaysList(
                title: "Recently played",
                children: playlists
                    .map((pl) =>
                        PlaylistItem(playlist: pl, isLoading: isLoading))
                    .toList()));
      },
    );
  }
}
