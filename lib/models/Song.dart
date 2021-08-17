import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Author.dart';
import 'package:flutter_app/models/Playlist.dart';

class Song {
  int id;
  String name;
  String author;
  int duration;
  bool isSaved;
  bool isLiked;
  Timestamp addedAt;
  String storagePath;
  DocumentReference songRef;

  Song(
      {this.id,
      this.name,
      this.author,
      this.duration,
      this.isSaved,
      this.isLiked,
      this.addedAt,
      this.songRef,
      this.storagePath});

  DocumentReference reference;

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
        name: json['name'] ?? "",
        author: json['author'],
        duration: json['duration'] ?? 0,
        isLiked: true,
        isSaved: true,
        addedAt: json['added_at'],
        storagePath: json['storage_path'],
        songRef: json['song']);
  }

  Map<String, dynamic> toJson() => _songToJson(this);
}

Song _songFromJson(Map<dynamic, dynamic> json) {
  return Song(
      name: json['name'] as String,
      duration: json['duration'] as int,
      author: json['author'] as String,
      storagePath: json['storage_path'] as String,
      isSaved: true,
      isLiked: true);
}

Map<String, dynamic> _songToJson(Song instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration,
      'isSaved': instance.isSaved,
      'isLiked': instance.isLiked,
    };
