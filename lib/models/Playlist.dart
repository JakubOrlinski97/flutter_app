import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Author.dart';
import 'package:flutter_app/models/PlaylistType.dart';
import 'package:flutter_app/models/Song.dart';

class Playlist {
  String name;
  String coverUrl;
  String author;
  bool saved;
  PlaylistType playlistType;
  DateTime releaseYear;
  List<Song> songs;

  Playlist(
      {this.name,
      this.coverUrl,
      this.author,
      this.playlistType,
      this.releaseYear,
      this.songs = const []});

  DocumentReference reference;

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return _playlistFromJson(json);
  }

  Map<String, dynamic> toJson() => _playlistToJson(this);
}

Playlist _playlistFromJson(Map<dynamic, dynamic> json) {
  List<Song> songs = [];

  if (json['songs'] != null) {
    songs = List.from(json['songs'])
        .map<Song>((song) => Song.fromJson(song))
        .toList();
  }

  return Playlist(
    name: json['name'] as String,
    coverUrl: json['coverUrl'] as String,
    author: json['author'] as String,
    playlistType: PlaylistType.album,
    releaseYear: (json['releaseYear'] as Timestamp).toDate(),
    songs: songs,
  );
}

Map<String, dynamic> _playlistToJson(Playlist instance) => <String, dynamic>{
      'name': instance.name,
      'coverUrl': instance.coverUrl,
      'playlistType': instance.playlistType,
      'releaseYear': instance.releaseYear,
    };
