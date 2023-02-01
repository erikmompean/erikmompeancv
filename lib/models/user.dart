import 'package:erikmompean/enums/languages.dart';

class User {
  final Languages language;

  User({required this.language});

  Map<String, dynamic> toJson() {
    return {
      // TODO cambiar por idioma
      'language': language.toString(),
    };
  }

  static User fromJson(Map<String, dynamic> json) =>
      User(language: LanguageExtension.fromString(json['language']));
}
