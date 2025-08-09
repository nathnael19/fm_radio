import 'package:ethio_fm_radio/Screens/Auth/model/user_element.dart';

class UserModel {
  final List<UserElement> users;

  UserModel({
    required this.users,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        users: List<UserElement>.from(
            json["users"].map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
