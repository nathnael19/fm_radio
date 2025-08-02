import 'package:ethio_fm_radio/cubit/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  static const String loginKey = "logged";

  LoginCubit() : super(NotLoggedIn());

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(loginKey) ?? false;

    emit(isLoggedIn ? LoggedIn() : NotLoggedIn());
  }

  Future<void> completeLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginKey, true);
    emit(LoggedIn());
  }

  Future<void> completeLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginKey, false);
    emit(NotLoggedIn());
  }
}
