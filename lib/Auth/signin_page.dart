import 'package:ethio_fm_radio/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Auth/create_account.dart';
import 'package:ethio_fm_radio/Auth/forget_password_page.dart';
import 'package:ethio_fm_radio/Onboarding/photo.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in",
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
                      hint: "Email/Phone",
                      controller: emailController,
                    ),

                    SizedBox(height: 16.h),

                    MyTextField(
                      hint: "Password",
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
                              builder: (context) => const ForgotPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot password?",
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
                      title: "Login",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyBottomNavigation(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

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
                      leftText: "Don't have an account?",
                      rightText: "Sign up",
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
