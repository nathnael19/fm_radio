import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  final TextEditingController newPasswordController =
      TextEditingController(); // Controller for new password
  final TextEditingController confirmPasswordController =
      TextEditingController(); // Controller for confirm password

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header image + logo
              MyPhoto(height: 401.h),

              SizedBox(height: 51.h),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Set New Password",
                      style: TextStyle(
                        color: Color(0xff1A0101),
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // New password input
                    MyTextField(
                      hint: "New Password",
                      controller: newPasswordController,
                    ),
                    SizedBox(height: 16.h),

                    // Confirm password input
                    MyTextField(
                      hint: "Confirm New Password",
                      controller: confirmPasswordController,
                    ),

                    SizedBox(height: 16.h),

                    // Reset password button
                    LoginContainer(
                      title: "Continue",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    MyDivider(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),

              TextContainer(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SigninPage()),
                  );
                },
                leftText: "Hava an Account?",
                rightText: "Sign in",
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
