import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'first_time_state.dart';

class FirstTimeCubit extends Cubit<LaunchState> {
  FirstTimeCubit() : super(LaunchLoading());

  Future<void> checkFirstLaunch() async {
    emit(LaunchLoading());
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool("is_first_time") ?? true;

    if (isFirstTime) {
      emit(FirstLaunch());
    } else {
      emit(NotFirstLaunch());
    }
  }

  Future<void> completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("is_first_time", false);
    emit(NotFirstLaunch());
  }
}
