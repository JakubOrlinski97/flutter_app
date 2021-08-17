import 'package:flutter_app/models/Song.dart';
import 'package:flutter_app/store/playback/actions.dart';
import 'package:redux/redux.dart';

final songReducer = combineReducers<Song>([
  TypedReducer<Song, SetSongAction>(_setSong),
]);

Song _setSong(Song current, SetSongAction action) {
  return action.song;
}
