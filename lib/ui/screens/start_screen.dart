import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_bloc.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_event.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_state.dart';
import 'package:erikmompean/enums/languages.dart';
import 'package:erikmompean/resources/app_images.dart';
import 'package:erikmompean/ui/widgets/app_logo.dart';
import 'package:erikmompean/ui/widgets/language_button.dart';
import 'package:erikmompean/ui/widgets/language_switch_explanation.dart';
import 'package:erikmompean/utils/app_colors.dart';
import 'package:erikmompean/utils/app_constants.dart';
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
            // var user = state.user;
            // NavigationService.instance.navigateToReplacement(
            //     user.language ? Routes.start : Routes.main);
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

              return Center(child: screen(bloc));
            }),
      ),
    );
  }

  Widget screen(StartScreenBloc bloc) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Hero(
                    tag: AppConstants.logoHeroTag,
                    child: AppLogo(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LanguageSwitchExplanation(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LanguageButton(
                        imagePath: AppImages.en,
                        isSelected: true,
                        onTap: () => bloc.add(StartScreenSelectLanguageEvent(
                            language: Languages.en)),
                      ),
                      const SizedBox(width: 20),
                      LanguageButton(
                        imagePath: AppImages.es,
                        onTap: () => bloc.add(StartScreenSelectLanguageEvent(
                            language: Languages.en)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
