import 'package:erikmompean/app_locator.dart';
import 'package:erikmompean/bloc/main_screen_bloc/main_screen_bloc.dart';
import 'package:erikmompean/bloc/start_screen_bloc/start_screen_bloc.dart';
import 'package:erikmompean/repositories/user_repository.dart';
import 'package:erikmompean/ui/screens/main_screen.dart';
import 'package:erikmompean/ui/screens/not_found_screen.dart';
import 'package:erikmompean/ui/screens/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String main = '/main';
  static const String start = '/start';

  static Route generateAppRoute(RouteSettings routeSettings) {
    var routePath = _getRoutePath(routeSettings);
    switch (routePath) {
      case main:
        return PageRouteBuilder(
            pageBuilder: (context, _, __) => BlocProvider<MainScreenBloc>(
                  create: (_) => MainScreenBloc(),
                  child: const MainScreen(),
                ));
      case start:
        return PageRouteBuilder(
            pageBuilder: (context, _, __) => BlocProvider<StartScreenBloc>(
                  create: (_) =>
                      StartScreenBloc(AppLocator.locate<UserRepository>()),
                  child: const StartScreen(),
                ));
    }

    return PageRouteBuilder(
        pageBuilder: (context, _, __) => const NotFoundScreen());
  }

  static String? _getRoutePath(RouteSettings settings) {
    if (settings.name != null && settings.name!.contains('?')) {
      return settings.name!.substring(0, settings.name!.indexOf('?'));
    }

    return settings.name;
  }

  static Widget transition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
