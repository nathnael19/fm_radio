import 'package:ethio_fm_radio/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Auth/reset_page.dart';
import 'package:ethio_fm_radio/Onboarding/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController phoneController =
      TextEditingController(); //Controller for phone number

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header image + logo
              MyPhoto(height: 401.h),

              SizedBox(height: 27.h),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(0xff1A0101),
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),

                    SizedBox(height: 16.h),

                    //Subtitle
                    Text(
                      "Enter your phone number and we’ll send you a code to reset your password.",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff001420),
                        fontFamily: "Poppins",
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Phone number field
                    MyTextField(
                      hint: "Phone Number",
                      controller: phoneController,
                    ),

                    SizedBox(height: 16.h),

                    // Send code button
                    LoginContainer(
                      title: "Send Code",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnterCodePage(),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 24.h),
                    MyDivider(),
                    SizedBox(height: 24.h),

                    // Back to Sign In link
                    TextContainer(
                      onTap: () {},
                      leftText: "Have an Account?",
                      rightText: "Sign in",
                    ),
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
