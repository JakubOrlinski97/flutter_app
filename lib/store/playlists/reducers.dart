import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/PlaylistType.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:flutter_app/store/playlists/actions.dart';
import 'package:redux/redux.dart';

final playlistsReducer = combineReducers<List<Playlist>>([
  TypedReducer<List<Playlist>, FetchPlaylistsAction>(_fetchPlaylists),
]);

List<Playlist> _fetchPlaylists(List<Playlist> state, action) {
  return [
    new Playlist(
        id: 1,
        name: 'name',
        coverUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5v2-aJ3JExm9MAWpj3Q1-Pu8AlrmkknSuFg&usqp=CAU",
        author: "author1",
        playlistType: PlaylistType.album,
        releaseYear: DateTime.now(),
        songs: []),
    new Playlist(
        id: 2,
        name: 'name second',
        coverUrl: "https://f4.bcbits.com/img/a1033071555_10.jpg",
        author: "author2",
        playlistType: PlaylistType.playlist,
        releaseYear: DateTime.now(),
        songs: []),
    new Playlist(
        id: 3,
        name: 'namethird',
        coverUrl:
            "https://geo-static.traxsource.com/files/images/66e431cfaf3e981b8a6ecb41735cb983.jpg",
        author: "author3",
        playlistType: PlaylistType.ep,
        releaseYear: DateTime.now(),
        songs: []),
    new Playlist(
        id: 4,
        name: 'name4',
        coverUrl:
            "https://cdn2.thelineofbestfit.com/images/remote/https_cdn2.thelineofbestfit.com/media/2014/IMG_0156.JPG",
        author: "author4",
        playlistType: PlaylistType.single,
        releaseYear: DateTime.now(),
        songs: []),
  ];
}

final songsReducer = combineReducers<List<Song>>([
  TypedReducer<List<Song>, FetchSongsAction>(_fetchSongs),
]);

List<Song> _fetchSongs(List<Song> state, action) {
  return [
    new Song(
        id: 1, name: "song 1", author: "Author", duration: 180, isSaved: false),
    new Song(
        id: 1, name: "song 2", author: "Author 2", duration: 240, isSaved: true)
  ];
}
