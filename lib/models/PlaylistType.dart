enum PlaylistType { album, ep, single, playlist }

extension PlaylistTypeParser on PlaylistType {
  String get parseType {
    switch (this) {
      case PlaylistType.album:
        return "Album";
      case PlaylistType.ep:
        return "EP";
      case PlaylistType.single:
        return "Single";
      case PlaylistType.playlist:
        return "Playlist";
      default:
        throw Exception("enum has more cases");
    }
  }

  PlaylistType fromConstant(int playlistType) {
    switch (playlistType) {
      case 1:
        return PlaylistType.album;
      case 2:
        return PlaylistType.ep;
      case 3:
        return PlaylistType.single;
      case 4:
        return PlaylistType.playlist;
      default:
        throw Exception("enum has more cases");
    }
  }
}
