import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/Song.dart';

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

    return Row(children: [
      CachedNetworkImage(imageUrl: widget.playlist.coverUrl),
      Column(children: [
        Text(widget.song.name, style: Theme.of(context).textTheme.headline4),
        Row(children: [
          widget.song.isSaved ?? Icon(Icons.cloud_download, color: Colors.green),
          Text(widget.song.author, style: Theme.of(context).textTheme.headline5)
        ]),
        widget.song.isLiked ?? Icon(EvaIcons.heart, color: Colors.green),
        Icon(EvaIcons.moreVerticalOutline, color: Colors.grey),
      ])
    ],);
  }
}
