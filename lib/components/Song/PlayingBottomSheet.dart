import 'dart:async';
import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Song/Playback.dart';
import 'package:flutter_app/models/MediaPlayer.dart';
import 'package:flutter_app/models/Song.dart';
import 'package:path_provider/path_provider.dart';

class PlayingBottomSheet extends StatelessWidget {
  const PlayingBottomSheet(
      {Key key,
      this.sliderValue,
      this.playerState,
      this.currentSong,
      this.play,
      this.pause})
      : super(key: key);

  final Function play;
  final Function pause;
  final double sliderValue;
  final PlayerState playerState;
  final Song currentSong;

  @override
  Widget build(BuildContext context) {
    if (currentSong == null) {
      return SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black)),
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FractionallySizedBox(
              widthFactor: 1.1,
              child: SizedBox(
                height: 3,
                child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        trackShape: RectangularSliderTrackShape(),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 0.0)),
                    child: Slider(
                        activeColor: Colors.grey.shade100,
                        inactiveColor: Colors.grey.shade700,
                        value: sliderValue,
                        onChanged: (double nv) => {})),
              ),
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text(currentSong.name),
              subtitle: Text(currentSong.author),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        if (playerState == PlayerState.playing) {
                          this.pause();
                        } else {
                          play();
                        }
                      },
                      icon: playerState == PlayerState.playing
                          ? Icon(Icons.pause)
                          : Icon(Icons.play_arrow))
                ],
              ),
            )
          ]),
    );
  }
}
