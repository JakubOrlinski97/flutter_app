import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Song/SongMenu.dart';
import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/MediaPlayer.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:flutter_app/store/playback/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';

class SongItem extends StatefulWidget {
  SongItem({Key key, this.song, this.playlist}) : super(key: key);

  final Song song;
  final Playlist playlist;

  @override
  _SongItemState createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  @override
  Widget build(BuildContext context) {
    final song = Provider.of<Song>(context);
    if (song == null) {
      return Container();
    }

    void showMenu() {
      showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.black,
          context: context,
          builder: (BuildContext context) {
            return SongMenu(song: song, playlist: widget.playlist);
          });
    }

    return StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () {
            store.dispatch(SetSongAction(song));
            store.state.mediaPlayer.play(song);
          };
        },
        builder: (context, setSong) => TextButton(
              onPressed: () {
                setSong();
              },
              child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading:
                      CachedNetworkImage(imageUrl: widget.playlist.coverUrl),
                  title: Text(song.name),
                  subtitle: Row(children: [
                    song.isSaved
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child:
                                Icon(Icons.cloud_download, color: Colors.green),
                          )
                        : Container(),
                    Text(song.author)
                  ]),
                  trailing: Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(EvaIcons.heart, color: Colors.green),
                      IconButton(
                          onPressed: showMenu,
                          icon: Icon(EvaIcons.moreVerticalOutline),
                          color: Colors.grey),
                    ],
                  )),
            ));
  }
}
