import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/store/playback/reducers.dart';
import 'package:flutter_app/store/playlists/reducers.dart';

AppState appReducer(AppState state, action) {
  return state.copyWith(
    playlists: playlistsReducer(state.playlists, action),
    currentSong: songReducer(state.currentSong, action),
  );
}
