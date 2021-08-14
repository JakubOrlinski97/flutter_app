import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Author.dart';

class Song {
  int id;
  String name;
  Author author;
  int duration;
  bool isSaved;
  bool isLiked;

  Song(
      {this.id,
      this.name,
      this.author,
      this.duration,
      this.isSaved,
      this.isLiked});

  DocumentReference reference;

  factory Song.fromSnapshot(QueryDocumentSnapshot snapshot) {
    print("song.fromSnapshot ${snapshot.data()}");
    return Song();
    // Song newSong = Song.fromJson();
    // newSong.reference = snapshot.;
    // return newSong;
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return _songFromJson(json);
  }

  Map<String, dynamic> toJson() => _songToJson(this);
}

Song _songFromJson(Map<dynamic, dynamic> json) {
  Author author = Author.fromJson({'name': 'Jake'});

  return Song(
      name: json['name'] as String,
      duration: json['duration'] as int,
      author: author,
      isSaved: true,
      isLiked: true);
}

Map<String, dynamic> _songToJson(Song instance) => <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration,
      'isSaved': instance.isSaved,
      'isLiked': instance.isLiked,
    };
