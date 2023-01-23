class User {
  final bool language;

  User({required this.language});

  Map<String, dynamic> toJson() {
    return {
      // TODO cambiar por idioma
      'language': language.toString(),
    };
  }

  static User fromJson(Map<String, dynamic> json) =>
      User(language: json['language'] == true);
}
