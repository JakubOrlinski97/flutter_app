import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/Song.dart';

class Database {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('playlists');

  Stream<List<Playlist>> get playlists {
    return collection.snapshots().map(_playlistsFromSnapshot);
  }

  List<Playlist> _playlistsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((playlist) {
      Playlist newPl = Playlist.fromJson(playlist.data());
      newPl.reference = playlist.reference;
      return newPl;
    }).toList();
  }

  Stream<Song> getSong(DocumentReference reference) {
    return reference.snapshots().map(_songFromSnapshot);
  }

  Song _songFromSnapshot(DocumentSnapshot snapshot) {
    return Song.fromJson(snapshot.data());
  }

  Future<DocumentReference> addPlaylist(Playlist playlist) {
    return collection.add(playlist.toJson());
  }

  updatePlaylist(Playlist playlist) async {
    await collection.doc(playlist.reference.id).set(playlist.toJson());
  }
}
