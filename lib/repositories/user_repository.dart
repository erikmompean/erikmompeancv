import 'dart:convert';

import 'package:erikmompean/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final String key = 'user';

  final SharedPreferences prefs;

  UserRepository(this.prefs);

  User? getUser() {
    String? optionalUser = prefs.getString(key);

    if (optionalUser == null) {
      return null;
    }

    var json = jsonDecode(optionalUser);

    return User.fromJson(json);
  }

  Future<bool> setUser(User user) async {
    return await prefs.setString(key, jsonEncode(user));
  }
}
