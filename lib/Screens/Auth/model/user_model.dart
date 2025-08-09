import 'package:ethio_fm_radio/Screens/Auth/model/user_element.dart';

class User {
  final List<UserElement> users;

  User({
    required this.users,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        users: List<UserElement>.from(
            json["users"].map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
