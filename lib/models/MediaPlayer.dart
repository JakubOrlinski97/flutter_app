import 'package:audioplayer/audioplayer.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MediaPlayer {
  bool isPlaying = false;
  AudioPlayer audioPlayer;

  MediaPlayer() {
    audioPlayer = AudioPlayer();
  }

  play(Song currentSong) async {
    try {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref(currentSong.storagePath)
          .getDownloadURL();
      audioPlayer.play(downloadURL);
      isPlaying = true;
    } catch (e) {
      print("ERROR $e");
    }
  }

  pause() {
    audioPlayer.stop();
    isPlaying = false;
  }
}
