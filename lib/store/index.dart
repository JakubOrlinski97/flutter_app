import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/store/playlists/reducers.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    playlists: playlistsReducer(state.playlists, action),
  );
}
