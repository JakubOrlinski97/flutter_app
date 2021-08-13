import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Song/SongList.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/PlaylistType.dart';

class PlaylistView extends StatefulWidget {
  PlaylistView({Key key}) : super(key: key);

  @override
  _PlaylistViewState createState() => _PlaylistViewState();
}

class _PlaylistViewState extends State<PlaylistView> {
  @override
  Widget build(BuildContext context) {
    Playlist playlist = ModalRoute.of(context).settings.arguments as Playlist;

    return Scaffold(
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
                    tag: 'hero-rectangle-${playlist.id}',
                    child: SizedBox(
                        width: 250,
                        height: 250,
                        child: CachedNetworkImage(imageUrl: playlist.coverUrl)),
                  ),
                  SizedBox(width: 50, child: Container()),
                ]),
            Expanded(
              child: Padding(
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
            ),
            SongList(playlist: playlist),
          ],
        ),
      )),
    );
  }
}
