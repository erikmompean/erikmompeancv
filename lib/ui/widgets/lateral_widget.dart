import 'dart:math';

import 'package:flutter/material.dart';

class LateralWidget extends StatefulWidget {
  final Widget child;

  const LateralWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  LateralWidgetState createState() => LateralWidgetState();
}

class LateralWidgetState extends State<LateralWidget> {
  @override
  Widget build(BuildContext context) {
    double angle;

    angle = -40 / 180 * pi;

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
