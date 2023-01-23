import 'package:erikmompean/ui/widgets/app_text.dart';
import 'package:erikmompean/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LanguageSwitchExplanation extends StatefulWidget {
  const LanguageSwitchExplanation({super.key});

  @override
  State<LanguageSwitchExplanation> createState() =>
      _LanguageSwitchExplanationState();
}

class _LanguageSwitchExplanationState extends State<LanguageSwitchExplanation> {
  bool isEnglish = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        AppText(
          text: isEnglish
              ? 'This web is made by me using Flutter.'
              : 'Esta web esta hecha por mi usando Flutter.',
          size: 22,
        ),
        const SizedBox(
          height: 20,
        ),
        AppText(
          color: AppColors.text,
          text: isEnglish
              ? 'Please choose a language:'
              : 'Antes de entrar elige un idioma:',
          size: 22,
        ),
      ],
    )
        .animate(
          delay: 1000.milliseconds,
          onComplete: (controller) {
            isEnglish = !isEnglish;
            setState(() {});

            controller.reset();
            controller.forward();
          },
        )
        .fadeIn()
        .fadeOut(delay: 5.seconds);
  }
}
