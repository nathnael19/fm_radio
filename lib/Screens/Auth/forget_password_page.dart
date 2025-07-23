import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/reset_page.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
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
  final String phone_error =
      "Phone Number cannot be empty of greater than or less than 10 character";

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        local.forgot_page_title,
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
                        local.forgot_page_desc,
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
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]').hasMatch(value) ||
                              value.length != 10) {
                            return phone_error;
                          } else {
                            return null;
                          }
                        },
                        hint: local.phone_number,
                        controller: phoneController,
                      ),

                      SizedBox(height: 16.h),

                      // Send code button
                      LoginContainer(
                        title: local.send_code,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EnterCodePage(),
                              ),
                            );
                          }
                        },
                      ),

                      SizedBox(height: 24.h),
                      MyDivider(),
                      SizedBox(height: 24.h),

                      // Back to Sign In link
                      TextContainer(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SigninPage(),
                            ),
                          );
                        },
                        leftText: local.signup_page_question,
                        rightText: local.signin_text,
                      ),
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
