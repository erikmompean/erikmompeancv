import 'dart:math';

import 'package:flutter/material.dart';

class FlipWidget extends StatefulWidget {
  final Widget child;
  final double angle;
  final bool revert;

  const FlipWidget({
    Key? key,
    required this.child,
    required this.angle,
    this.revert = false,
  }) : super(key: key);

  @override
  FlipWidgetState createState() => FlipWidgetState();
}

class FlipWidgetState extends State<FlipWidget> {
  @override
  Widget build(BuildContext context) {
    double angle;

    if (widget.revert) {
      angle = -widget.angle / 180 * pi;
    } else {
      angle = widget.angle / 180 * pi;
    }
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
