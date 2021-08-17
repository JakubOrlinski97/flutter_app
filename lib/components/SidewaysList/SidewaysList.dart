import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Playlist/PlaylistItem.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:provider/provider.dart';

class SidewaysList extends StatelessWidget {
  const SidewaysList({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double IMAGE_SIZE = 100;
    double TEXT_HEIGHT = 20;
    double MARGIN_HEIGHT = 5;

    final playlists = Provider.of<List<Playlist>>(context);
    if (playlists == null) {
      return CircularProgressIndicator();
    }

    return Column(children: [
      Text(title, style: Theme.of(context).textTheme.headline5),
      AspectRatio(
          aspectRatio: 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: playlists
                .map((playlist) => playlist != null
                    ? PlaylistItem(
                        playlist: playlist,
                        isLoading: false,
                      )
                    : Container())
                .toList(),
          ))
    ]);
  }
}
