import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Shaders/ShimmerLoading.dart';
import 'package:flutter_app/models/Playlist.dart';

class PlaylistItem extends StatefulWidget {
  PlaylistItem({Key key, this.playlist, this.isLoading}) : super(key: key);

  final Playlist playlist;
  final bool isLoading;

  @override
  _PlaylistItemState createState() => _PlaylistItemState();
}

class _PlaylistItemState extends State<PlaylistItem> {
  double IMAGE_SIZE = 100;
  double MARGIN_HEIGHT = 5;
  double TEXT_HEIGHT = 20;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/playlist', arguments: widget.playlist);
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: IMAGE_SIZE,
                    height: IMAGE_SIZE,
                    child: _buildImage(),
                  ),
                  Container(height: MARGIN_HEIGHT),
                  _buildText()
                ])));
  }

  Widget _buildImage() {
    if (widget.isLoading) {
      return ShimmerLoading(
          isLoading: widget.isLoading,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ));
    } else {
      return Hero(
          tag: 'hero-rectangle-${widget.playlist.reference.id}',
          child: SizedBox(
              width: IMAGE_SIZE,
              height: IMAGE_SIZE,
              child: CachedNetworkImage(imageUrl: widget.playlist.coverUrl)));
    }
  }

  Widget _buildText() {
    if (widget.isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: IMAGE_SIZE,
            height: TEXT_HEIGHT,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          Container(height: MARGIN_HEIGHT),
          Container(
            width: IMAGE_SIZE / 2,
            height: TEXT_HEIGHT,
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
        ],
      );
    } else {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.playlist.name, style: TextStyle(color: Colors.white)),
        Text(widget.playlist.author, style: TextStyle(color: Colors.white))
      ]);
    }
  }
}
