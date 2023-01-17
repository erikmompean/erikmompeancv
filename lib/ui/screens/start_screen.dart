import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_bloc.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_event.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_state.dart';
import 'package:erikmompean/navigation_service.dart';
import 'package:erikmompean/ui/widgets/app_logo.dart';
import 'package:erikmompean/ui/widgets/app_text.dart';
import 'package:erikmompean/utils/app_colors.dart';
import 'package:erikmompean/utils/app_constants.dart';
import 'package:erikmompean/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StartScreenBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          if (state is SplashFinishedLoadingState) {
            var user = state.user;
            NavigationService.instance.navigateToReplacement(
                user.isFirstTime ? Routes.start : Routes.main);
          }
        },
        child: BlocBuilder(
            bloc: bloc,
            buildWhen: (previous, current) =>
                current != StartScreenInitialState,
            builder: (context, state) {
              if (state is SplashInitState) {
                bloc.add(StartScreenInitializeEvent());
              }

              return body();
            }),
      ),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Hero(
                  tag: AppConstants.logoHeroTag,
                  child: AppLogo(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              color: AppColors.text,
              text: 'Esta web esta hecha por mi usando Flutter',
              size: 22,
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              color: AppColors.text,
              text: 'Antes de empezar... Elige un idioma:',
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
