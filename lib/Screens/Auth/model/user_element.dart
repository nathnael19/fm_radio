import 'package:ethio_fm_radio/Screens/Auth/model/favorite_section.dart';
import 'package:ethio_fm_radio/Screens/Auth/model/listening_history.dart';

class UserElement {
  final String userId;
  final String username;
  final String email;
  final String password;
  final String phone;
  final List<FavoriteStation> favoriteStations;
  final List<ListeningHistory> listeningHistory;

  UserElement({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.favoriteStations,
    required this.listeningHistory,
  });

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        userId: json["userId"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        favoriteStations: List<FavoriteStation>.from(
            json["favoriteStations"].map((x) => FavoriteStation.fromJson(x))),
        listeningHistory: List<ListeningHistory>.from(
            json["listeningHistory"].map((x) => ListeningHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "favoriteStations":
            List<dynamic>.from(favoriteStations.map((x) => x.toJson())),
        "listeningHistory":
            List<dynamic>.from(listeningHistory.map((x) => x.toJson())),
      };
}
