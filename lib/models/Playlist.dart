import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Author.dart';
import 'package:flutter_app/models/PlaylistType.dart';
import 'package:flutter_app/models/Song.dart';

class Playlist {
  String name;
  String coverUrl;
  Author author;
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

  factory Playlist.fromSnapshot(DocumentSnapshot snapshot) {
    print("Playlist.fromSnapshot, ${snapshot.data()}");
    Playlist newPlaylist = Playlist.fromJson(snapshot.data());
    newPlaylist.reference = snapshot.reference;
    return newPlaylist;
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return _playlistFromJson(json);
  }

  Map<String, dynamic> toJson() => _playlistToJson(this);
}

Playlist _playlistFromJson(Map<dynamic, dynamic> json) {
  Author author = Author.fromJson({'name': 'Jake'});

  return Playlist(
    name: json['name'] as String,
    coverUrl: json['coverUrl'] as String,
    author: author,
    playlistType: PlaylistType.album,
    releaseYear: (json['releaseYear'] as Timestamp).toDate(),
    songs: json['songs'] as List<Song>,
  );
}

Map<String, dynamic> _playlistToJson(Playlist instance) => <String, dynamic>{
      'name': instance.name,
      'coverUrl': instance.coverUrl,
      'playlistType': instance.playlistType,
      'releaseYear': instance.releaseYear,
    };
