import 'package:erikmompean/bloc/curriculum_screen_bloc/Curriculum_screen_event.dart';
import 'package:erikmompean/bloc/curriculum_screen_bloc/Curriculum_screen_state.dart';
import 'package:erikmompean/bloc/curriculum_screen_bloc/curriculum_screen_bloc.dart';
import 'package:erikmompean/ui/widgets/app_logo.dart';
import 'package:erikmompean/ui/widgets/app_text.dart';
import 'package:erikmompean/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CurriculumScreenBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is CurriculumScreenStateInit) {
              bloc.add(CurriculumScreenInitializeEvent());
            }

            return body();
          }),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AppLogo(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            AppText(text: 'Nombre'),
                            AppText(text: 'Erik Mompean Ruiz'),
                            SizedBox(
                              height: 10,
                            ),
                            AppText(text: 'Email'),
                            AppText(text: 'erikmompeanruiz@gmail.com'),
                            SizedBox(
                              height: 10,
                            ),
                            AppText(text: 'Nacionalidad'),
                            AppText(text: 'España'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: const [
                        AppText(text: 'Erik Mompean'),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: const [
                        AppText(text: 'Erik Mompean'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}