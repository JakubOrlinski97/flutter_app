import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/PlaylistType.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:flutter_app/store/playlists/actions.dart';
import 'package:redux/redux.dart';

final playlistsReducer = combineReducers<List<Playlist>>([
  TypedReducer<List<Playlist>, FetchedPlaylistsAction>(_fetchedPlaylists),
]);

List<Playlist> _fetchedPlaylists(
    List<Playlist> state, FetchedPlaylistsAction action) {
  return action.playlists;
}
