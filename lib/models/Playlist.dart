import 'package:flutter_app/models/PlaylistType.dart';
import 'package:flutter_app/models/Song.dart';

class Playlist {
  int id;
  String name;
  String coverUrl;
  String author;
  bool saved;
  PlaylistType playlistType;
  DateTime releaseYear;
  List<Song> songs;

  Playlist(
      {this.id,
      this.name,
      this.coverUrl,
      this.author,
      this.playlistType,
      this.releaseYear,
      this.songs = const []});
}
