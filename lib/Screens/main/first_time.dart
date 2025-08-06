import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/main/bottom_navigation.dart';
import 'package:ethio_fm_radio/cubit/first_time/first_time_cubit.dart';
import 'package:ethio_fm_radio/cubit/login/login_cubit.dart';
import 'package:ethio_fm_radio/cubit/login/login_state.dart';
import 'package:ethio_fm_radio/Screens/main/my_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstTime extends StatelessWidget {
  const FirstTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstTimeCubit, LaunchState>(
      builder: (context, firstTimeState) {
        if (firstTimeState is LaunchLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If this is the first time opening the app, show onboarding
        if (firstTimeState is FirstLaunch) {
          return const MyPageView(); // Onboarding screen
        }

        // Not first launch: check login state
        context.read<LoginCubit>().checkLogin();

        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, loginState) {
            if (loginState is LoggedIn) {
              return const MyBottomNavigation();
            } else if (loginState is NotLoggedIn) {
              return const SigninPage();
            } else {
              // Optional: Handle LoginInitial if you add it later
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        );
      },
    );
  }
}
