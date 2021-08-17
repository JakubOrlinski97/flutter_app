import 'dart:async';
import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/AppState.dart';
import 'package:flutter_app/models/MediaPlayer.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:flutter_redux/flutter_redux.dart';

enum PlayerState { stopped, playing, paused }

class PlayBack extends StatefulWidget {
  const PlayBack({Key key, this.child}) : super(key: key);

  final Function child;

  @override
  _PlayBackState createState() => _PlayBackState();
}

class _PlayBackState extends State<PlayBack> {
  Song currentSong;

  Duration duration;
  Duration position;

  String localFilePath;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  MediaPlayer mediaPlayer;
  AudioPlayer audioPlayer;

  void initAudioPlayer() {
    audioPlayer = mediaPlayer.audioPlayer;
    _positionSubscription = audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() => position = p);
    });
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
      if (s == AudioPlayerState.PLAYING) {
        setState(() {
          playerState = PlayerState.playing;
          duration = audioPlayer.duration;
        });
      } else if (s == AudioPlayerState.PAUSED) {
        setState(() {
          playerState = PlayerState.paused;
        });
      } else if (s == AudioPlayerState.STOPPED) {
        onComplete();
        setState(() {
          position = duration;
        });
      }
    }, onError: (msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await mediaPlayer.play(currentSong);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppState state = StoreProvider.of<AppState>(context).state;

    if (state != null && state.mediaPlayer != null) {
      if (mediaPlayer == null) {
        mediaPlayer = state.mediaPlayer;
        initAudioPlayer();
      } else if (state.currentSong != currentSong) {
        setState(() {
          return currentSong = state.currentSong;
        });
      }
    }

    double sliderValue = 0;
    if (this.duration != null && this.position != null) {
      sliderValue = this.position.inSeconds / this.duration.inSeconds;
    }
    return StoreConnector<AppState, Song>(
        converter: (store) => store.state.currentSong,
        builder: (context, Song currentSong) {
          Widget child = widget.child.call(
              sliderValue: sliderValue,
              playerState: playerState,
              currentSong: currentSong,
              play: play,
              pause: pause);

          return child;
        });
  }
}
