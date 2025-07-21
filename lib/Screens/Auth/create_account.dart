import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreactAccountPage extends StatefulWidget {
  const CreactAccountPage({super.key});

  @override
  State<CreactAccountPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<CreactAccountPage> {
  // Controllers for the form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top background image
              MyPhoto(height: 191.h),
              SizedBox(height: 27.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Page title
                    Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xff1A0101),
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),

                    const SizedBox(height: 16),

                    //Full Name
                    MyTextField(hint: "Full Name", controller: nameController),

                    const SizedBox(height: 16),

                    // Email
                    MyTextField(hint: "Email", controller: emailController),

                    const SizedBox(height: 16),

                    //Phone Number
                    MyTextField(
                      hint: "Phone Number",
                      controller: phoneController,
                    ),
                    const SizedBox(height: 16),

                    MyTextField(
                      hint: "Password",
                      controller: passwordController,
                    ),

                    const SizedBox(height: 16),

                    MyTextField(
                      hint: "Confirm Password",
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 16),

                    LoginContainer(
                      title: "Create Account",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyBottomNavigation(),
                          ),
                        );
                      },
                    ),
                    // Account Button
                    const SizedBox(height: 20),

                    MyDivider(),

                    // Already have account link
                    TextContainer(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninPage(),
                          ),
                        );
                      },
                      leftText: "Have an account?",
                      rightText: "Sign in",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
