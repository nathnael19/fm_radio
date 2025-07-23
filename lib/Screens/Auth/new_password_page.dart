import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
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
    final local = AppLocalizations.of(context)!;
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
                      local.new_pass_page_title,
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
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[0-9]').hasMatch(value) ||
                            value.length != 10) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      hint: local.new_pass,
                      controller: newPasswordController,
                    ),
                    SizedBox(height: 16.h),

                    // Confirm password input
                    MyTextField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[0-9]').hasMatch(value) ||
                            value.length != 10) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      hint: local.new_conf_pass,
                      controller: confirmPasswordController,
                    ),

                    SizedBox(height: 16.h),

                    // Reset password button
                    LoginContainer(
                      title: local.continue_text,
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
                leftText: local.signup_page_question,
                rightText: local.signin_text,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
