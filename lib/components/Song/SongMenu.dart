import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/Song.dart';

class SongMenu extends StatelessWidget {
  const SongMenu({Key key, this.playlist, this.song}) : super(key: key);

  final Song song;
  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    void onLikePressed() {}
    void closeModal() {
      Navigator.pop(context);
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: ListView(
          children: [
            GestureDetector(
              onTap: closeModal,
              behavior: HitTestBehavior.translucent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                        width: 200,
                        height: 200,
                        child: CachedNetworkImage(imageUrl: playlist.coverUrl)),
                  ),
                  Align(
                      child: Text(song.name,
                          style: Theme.of(context).textTheme.headline5)),
                  Align(child: Text(song.author)),
                ],
              ),
            ),
            TextButton(
              onPressed: onLikePressed,
              child: ListTile(
                  leading: Icon(EvaIcons.heart, color: Colors.green),
                  title: Text("Liked")),
            ),
            ListTile(
                leading: Icon(EvaIcons.musicOutline, color: Colors.grey),
                title: Text("Add to playlist")),
            ListTile(
                leading: Icon(EvaIcons.menuOutline, color: Colors.grey),
                title: Text("Add to queue")),
            ListTile(
                leading: Icon(Icons.album_outlined, color: Colors.grey),
                title: Text("View album")),
            ListTile(
                leading: Icon(EvaIcons.personOutline, color: Colors.grey),
                title: Text("View artist")),
            ListTile(
                leading: Icon(EvaIcons.shareOutline, color: Colors.grey),
                title: Text("Share"))
          ],
        ),
      ),
    );
  }
}
