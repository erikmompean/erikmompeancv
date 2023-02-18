import 'dart:math';

import 'package:flutter/material.dart';

class FlipWidget extends StatefulWidget {
  final Widget child;
  const FlipWidget({Key? key, required this.child}) : super(key: key);

  @override
  FlipWidgetState createState() => FlipWidgetState();
}

class FlipWidgetState extends State<FlipWidget> {
  @override
  Widget build(BuildContext context) {
    final angle = -30 / 180 * pi;
    var transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angle);
    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: widget.child,
    );
  }
}
