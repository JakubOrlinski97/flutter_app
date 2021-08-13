import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/Playlist.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Playlist> playlists;

  AppState({this.playlists = const []});

  factory AppState.empty() => AppState(playlists: []);

  AppState copyWith({
    List<Playlist> playlists,
  }) {
    return AppState(playlists: playlists ?? this.playlists);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          playlists == other.playlists;

  @override
  String toString() {
    return 'AppState{playlists: $playlists}';
  }
}
