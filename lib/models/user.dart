import 'package:erikmompean/enums/languages.dart';

class User {
  Languages language;

  User({required this.language});

  User.createDefault({this.language = Languages.none});

  Map<String, dynamic> toJson() {
    return {
      'language': language.name,
    };
  }

  static User fromJson(Map<String, dynamic> json) =>
      User(language: LanguageExtension.fromString(json['language']));
}
