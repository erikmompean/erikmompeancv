import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:erikmompean/navigation_service.dart';
import 'package:erikmompean/ui/widgets/app_logo.dart';
import 'package:erikmompean/utils/app_colors.dart';
import 'package:erikmompean/utils/app_constants.dart';
import 'package:erikmompean/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SplashScreenBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is SplashFinishedLoadingState) {
            var user = state.user;
            NavigationService.instance.navigateToReplacement(
                user.language ? Routes.start : Routes.main);
          }
        },
        child: BlocBuilder(
            bloc: bloc,
            buildWhen: (previous, current) =>
                current != SplashFinishedLoadingState,
            builder: (context, state) {
              if (state is SplashInitState) {
                bloc.add(SplashScreenInitEvent());
              }

              return body();
            }),
      ),
    );
  }

  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Hero(
            tag: AppConstants.logoHeroTag,
            child: AppLogo(),
          ),
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
