import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'app_logo.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppLogo(),
          const SizedBox(
            height: 40,
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const RadialGradient(
                center: Alignment.topLeft,
                radius: 1.0,
                colors: <Color>[Colors.blue, Colors.pink],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: LoadingAnimationWidget.bouncingBall(
                color: Colors.white, size: 50),
          ),
        ],
      ),
    );
  }
}
