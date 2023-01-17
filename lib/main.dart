import 'package:erikmompean/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:erikmompean/navigation_service.dart';
import 'package:erikmompean/ui/screens/splash_screen.dart';
import 'package:erikmompean/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'utils/app_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Erik Mompean',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      scrollBehavior: AppScrollBehavior(),
      navigatorKey: NavigationService.instance.navigationKey,
      onGenerateRoute: Routes.generateAppRoute,
      home: BlocProvider<SplashScreenBloc>(
        create: (_) => SplashScreenBloc(),
        child: const SplashScreen(),
      ),
    );
  }
}
