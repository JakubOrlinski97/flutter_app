import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/PlaylistType.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class FetchedPlaylistsAction {
  List<Playlist> playlists;

  FetchedPlaylistsAction(this.playlists);
}

ThunkAction<AppState> fetchPlaylistsAction() {
  return (Store<AppState> store) async {
    CollectionReference playlistsRef =
        FirebaseFirestore.instance.collection('playlists');

    QuerySnapshot querySnapshot = await playlistsRef.get();

    List<Playlist> pls = querySnapshot.docs.map((doc) {
      doc.get(FieldPath(['author']));
      return Playlist.fromJson(doc.data());
    }).toList();

    store.dispatch(FetchedPlaylistsAction(pls));
  };
}
