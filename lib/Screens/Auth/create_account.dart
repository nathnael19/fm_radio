import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
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
    final local = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final String fullname_error = local.form_name_error;
    final String email_error = local.form_email_error;
    final String phone_error = local.form_phone_error;
    String pass_error = local.form_pass_error;
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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Page title
                      Text(
                        local.signup_page_title,
                        style: TextStyle(
                          color: Color(0xff1A0101),
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        ),
                      ),

                      const SizedBox(height: 16),

                      //Full Name
                      MyTextField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                              return fullname_error;
                            } else {
                              return null;
                            }
                          },
                          hint: local.full_name,
                          controller: nameController),

                      const SizedBox(height: 16),

                      // Email
                      MyTextField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(value)) {
                              return email_error;
                            } else {
                              return null;
                            }
                          },
                          hint: local.email,
                          controller: emailController),

                      const SizedBox(height: 16),

                      //Phone Number
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
                      const SizedBox(height: 16),
//pass
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return pass_error;
                          } else {
                            return null;
                          }
                        },
                        hint: local.password,
                        controller: passwordController,
                      ),

                      const SizedBox(height: 16),
//confirm pass
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return pass_error;
                          } else {
                            return null;
                          }
                        },
                        hint: local.confirm_pass,
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(height: 16),

                      LoginContainer(
                        title: local.create_acc,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              setState(() {
                                pass_error = local.form_pass_error2;
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyBottomNavigation(),
                                ),
                              );
                            }
                          }
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
                        leftText: local.signup_page_question,
                        rightText: local.signin_text,
                      ),
                    ],
                  ),
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
