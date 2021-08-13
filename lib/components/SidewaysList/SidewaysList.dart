import 'package:flutter/material.dart';

class SidewaysList extends StatelessWidget {
  const SidewaysList({
    Key key,
    this.children,
    this.title,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    double IMAGE_SIZE = 100;
    double TEXT_HEIGHT = 20;
    double MARGIN_HEIGHT = 5;

    return Column(children: [
      Text(title, style: Theme.of(context).textTheme.headline5),
      SizedBox(
          height: IMAGE_SIZE + TEXT_HEIGHT * 2 + MARGIN_HEIGHT * 3,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: children,
          ))
    ]);
  }
}
