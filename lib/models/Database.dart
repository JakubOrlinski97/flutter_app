import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Playlist.dart';

class Database {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('playlists');

  Stream<QuerySnapshot> get playlists {
    return collection.snapshots();
  }

  Future<DocumentReference> addPlaylist(Playlist playlist) {
    return collection.add(playlist.toJson());
  }

  updatePlaylist(Playlist playlist) async {
    await collection.doc(playlist.reference.id).set(playlist.toJson());
  }
}
