import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/MediaPlayer.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Playlist> playlists;
  final MediaPlayer mediaPlayer;
  Song currentSong;

  AppState({this.playlists = const [], this.mediaPlayer, this.currentSong});

  factory AppState.empty() =>
      AppState(playlists: [], mediaPlayer: new MediaPlayer());

  AppState copyWith({
    List<Playlist> playlists,
    MediaPlayer mediaPlayer,
    Song currentSong,
  }) {
    return AppState(
        playlists: playlists ?? this.playlists,
        currentSong: currentSong ?? this.currentSong,
        mediaPlayer: mediaPlayer ?? this.mediaPlayer);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          playlists == other.playlists &&
          currentSong == other.currentSong;

  @override
  String toString() {
    return 'AppState{playlists: $playlists}';
  }
}
