import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ethio_fm_radio/Screens/Auth/model/user_element.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final String binId = '68972ef5d0ea881f40550a22';
  final String secretKey =
      "\$2a\$10\$OdrPUzOSvGmobZmaalIaC.xV3OJsf4kym57057x7siedund/ZQTMC";

  List<dynamic> _extractUsers(dynamic jsonData) {
    final record = jsonData['record'];
    if (record is List) {
      // Old format: record is a list containing an object with users
      return record.first['users'] as List<dynamic>;
    } else if (record is Map<String, dynamic>) {
      // New format: record is an object with users
      return record['users'] as List<dynamic>;
    } else {
      throw Exception('Unexpected JSON record structure');
    }
  }

  Future<void> loadUsers() async {
    emit(UserLoading());
    try {
      final url = Uri.parse('https://api.jsonbin.io/v3/b/$binId/latest');
      final response = await http.get(url, headers: {
        'X-Master-Key': secretKey,
      });

      if (response.statusCode != 200) {
        throw Exception('Failed to load JSON: ${response.statusCode}');
      }

      final jsonData = jsonDecode(response.body);
      final usersJson = _extractUsers(jsonData);
      final users = usersJson.map((e) => UserElement.fromJson(e)).toList();

      emit(UserLoaded(users: users));
    } catch (e) {
      emit(UserFailed(msg: e.toString()));
    }
  }

  Future<void> signupUser(UserElement newUser) async {
    emit(UserLoading());

    try {
      final url = Uri.parse('https://api.jsonbin.io/v3/b/$binId/latest');
      final getResponse = await http.get(url, headers: {
        'X-Master-Key': secretKey,
      });

      if (getResponse.statusCode != 200) {
        throw Exception('Failed to load JSON: ${getResponse.statusCode}');
      }

      final jsonData = jsonDecode(getResponse.body);
      List<dynamic> existingUsers = _extractUsers(jsonData);

      // Check if email exists already
      bool emailExists = existingUsers.any((userJson) =>
          userJson['email'] != null &&
          userJson['email'].toString().toLowerCase() ==
              newUser.email.toLowerCase());

      if (emailExists) {
        emit(UserFailed(msg: 'Email already registered'));
        return;
      }

      existingUsers.add(newUser.toJson());

      final updatedJson = {
        "users": existingUsers,
      };

      final putUrl = Uri.parse('https://api.jsonbin.io/v3/b/$binId');
      final putResponse = await http.put(
        putUrl,
        headers: {
          'Content-Type': 'application/json',
          'X-Master-Key': secretKey,
          'X-Bin-Versioning': 'false',
        },
        body: jsonEncode(updatedJson),
      );

      if (putResponse.statusCode != 200) {
        throw Exception('Failed to update JSON: ${putResponse.statusCode}');
      }

      final updatedUsers =
          existingUsers.map((e) => UserElement.fromJson(e)).toList();
      emit(UserLoaded(users: updatedUsers));
    } catch (e) {
      emit(UserFailed(msg: e.toString()));
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    print(
        'loginUser called with email: $email, password: $password'); // Debug print

    emit(UserLoading());

    try {
      final url = Uri.parse('https://api.jsonbin.io/v3/b/$binId/latest');
      final response = await http.get(url, headers: {
        'X-Master-Key': secretKey,
      });

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200) {
        emit(UserFailed(msg: "Failed to load users"));
        return;
      }

      final jsonData = jsonDecode(response.body);
      final usersJson = _extractUsers(jsonData);

      final users = usersJson.map((e) => UserElement.fromJson(e)).toList();

      final matchedUser = users.firstWhere(
        (user) =>
            user.email.toLowerCase() == email.toLowerCase() &&
            user.password == password,
        orElse: () => UserElement(
          userId: '',
          username: '',
          email: '',
          password: '',
          phone: '',
          favoriteStations: [],
          listeningHistory: [],
        ),
      );

      if (matchedUser.userId.isEmpty) {
        emit(UserFailed(msg: "Invalid email or password"));
      } else {
        emit(UserLoaded(users: users));
      }
    } catch (e) {
      emit(UserFailed(msg: "Error: ${e.toString()}"));
    }
  }
}
