import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/create_account.dart';
import 'package:ethio_fm_radio/Screens/Auth/forget_password_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  //controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          //to avoid overflow when keyboard shows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //Align text to start
            children: [
              //Header image with background and logo overlay
              MyPhoto(height: 247.h),

              SizedBox(height: 27.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        local.login_page_title,
                        style: TextStyle(
                          color: Color(0xff1A0101),
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Email/Phone input field
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)) {
                            return local.form_email_error;
                          } else {
                            return null;
                          }
                        },
                        hint: local.email,
                        controller: emailController,
                      ),

                      SizedBox(height: 16.h),

                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return local.form_pass_error;
                          } else {
                            return null;
                          }
                        },
                        hint: local.password,
                        controller: passwordController,
                        isPass: true,
                      ),

                      SizedBox(height: 16.h),

                      //  Forgot password link
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                          child: Text(
                            local.forgot_password_text,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff001420),
                              fontSize: 14.sp,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Login button
                      LoginContainer(
                        title: local.login_text,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyBottomNavigation(),
                              ),
                            );
                          }
                        },
                      ),

                      SizedBox(height: 20.h),

                      //Sign up redirect link
                      TextContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreactAccountPage(),
                            ),
                          );
                        },
                        leftText: local.signup_question,
                        rightText: local.signup_text,
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
