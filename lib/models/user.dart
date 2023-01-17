class User {
  final bool isFirstTime;

  User({required this.isFirstTime});

  Map<String, dynamic> toJson() {
    return {
      'isFirstTime': isFirstTime,
    };
  }

  static User fromJson(Map<String, dynamic> json) =>
      User(isFirstTime: json['isFirstTime']);
}
