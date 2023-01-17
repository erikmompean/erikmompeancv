import 'package:erikmompean/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocator {
  static Future<void> setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _registerSingleton(UserRepository(prefs));
  }

  static void _registerSingleton<T extends Object>(T instance) {
    if (!GetIt.instance.isRegistered<T>()) {
      GetIt.instance.registerSingleton(instance);
    }
  }

  static void _registerLazySingleton<T extends Object>(
      T Function() factoryFunction) {
    if (!GetIt.instance.isRegistered<T>()) {
      GetIt.instance.registerLazySingleton(factoryFunction);
    }
  }

  static void _registerFactory<T extends Object>(T Function() factoryFunction) {
    if (!GetIt.instance.isRegistered<T>()) {
      GetIt.instance.registerFactory(factoryFunction);
    }
  }

  static T locate<T extends Object>() {
    var element = GetIt.instance.get<T>();

    return element;
  }
}
