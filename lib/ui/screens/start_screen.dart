import 'package:erikmompean/bloc/start_screen_bloc/start_screen_bloc.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_event.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_state.dart';
import 'package:erikmompean/enums/languages.dart';
import 'package:erikmompean/resources/app_images.dart';
import 'package:erikmompean/ui/widgets/app_loader.dart';
import 'package:erikmompean/ui/widgets/app_logo.dart';
import 'package:erikmompean/ui/widgets/app_text.dart';
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
      body: BlocBuilder(
          bloc: bloc,
          buildWhen: (previous, current) =>
              current != StartScreenInitialState,
          builder: (BuildContext context, StartScreenState state) {
            if (state is StartScreenInitialState) {
              bloc.add(StartScreenInitializeEvent());
            } else if (state is StartScreenLanguage) {
              return Center(child: screen(bloc, state));
            }
            return const AppLoader();
          }),
    );
  }

  Widget screen(StartScreenBloc bloc, StartScreenLanguage state) {
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
                        isSelected: state.language == Languages.en,
                        onTap: () => bloc.add(StartScreenSelectLanguageEvent(
                            language: Languages.en)),
                      ),
                      const SizedBox(width: 20),
                      LanguageButton(
                        imagePath: AppImages.es,
                        isSelected: state.language == Languages.es,
                        onTap: () => bloc.add(StartScreenSelectLanguageEvent(
                            language: Languages.es)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () => bloc.add(StartScreeenContiunuePressedEvent()),
                    child: Container(
                      height: 50,
                      width: 240,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: <Color>[
                            Colors.blue.shade200,
                            Colors.pink.shade200
                          ],
                        ),
                      ),
                      child: const Center(
                        child: AppText(
                          size: 18,
                          color: AppColors.contrastedText,
                          text: 'Continuar',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
