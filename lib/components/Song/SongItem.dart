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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: CachedNetworkImage(imageUrl: widget.playlist.coverUrl)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.song.name,
                style: Theme.of(context).textTheme.headline4),
            Row(children: [
              widget.song.isSaved
                  ? Icon(Icons.cloud_download, color: Colors.green)
                  : Text("not saved"),
              Text(widget.song.author.name,
                  style: Theme.of(context).textTheme.headline5)
            ])
          ]),
          widget.song.isLiked
              ? Icon(EvaIcons.heart, color: Colors.green)
              : Text("not Liked"),
          Icon(EvaIcons.moreVerticalOutline, color: Colors.grey),
        ],
      ),
    );
  }
}
