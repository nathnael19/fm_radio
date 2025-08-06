import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/Screens/constants/app_color.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/Screens/main/bottom_navigation.dart';
import 'package:ethio_fm_radio/cubit/login/login_cubit.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    final appColor = AppColor();

    final String fullnameError = local.form_name_error;
    final String emailError = local.form_email_error;
    final String phoneError = local.form_phone_error;
    String passError = local.form_pass_error;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top background image
              MyPhoto(height: getMobileHeight(context, 191)),
              SizedBox(height: getMobileHeight(context, 27)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getMobileWidth(context, 16)),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Page title
                      Text(
                        local.signup_page_title,
                        style: TextStyle(
                          color: appColor.titleTextColor,
                          fontSize: getMobileFontSize(context, 36),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        ),
                      ),

                      SizedBox(height: getMobileHeight(context, 16)),

                      //Full Name
                      MyTextField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                              return fullnameError;
                            } else {
                              return null;
                            }
                          },
                          hint: local.full_name,
                          controller: nameController),

                      SizedBox(height: getMobileHeight(context, 16)),

                      // Email
                      MyTextField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(value)) {
                              return emailError;
                            } else {
                              return null;
                            }
                          },
                          hint: local.email,
                          controller: emailController),

                      SizedBox(height: getMobileHeight(context, 16)),

                      //Phone Number
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]').hasMatch(value) ||
                              value.length != 10) {
                            return phoneError;
                          } else {
                            return null;
                          }
                        },
                        hint: local.phone_number,
                        controller: phoneController,
                      ),
                      SizedBox(height: getMobileHeight(context, 16)),
//pass
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return passError;
                          } else {
                            return null;
                          }
                        },
                        hint: local.password,
                        controller: passwordController,
                      ),

                      SizedBox(height: getMobileHeight(context, 16)),
//confirm pass
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return passError;
                          } else {
                            return null;
                          }
                        },
                        hint: local.confirm_pass,
                        controller: confirmPasswordController,
                      ),
                      SizedBox(height: getMobileHeight(context, 16)),

                      LoginContainer(
                        title: local.create_acc,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              setState(() {
                                passError = local.form_pass_error2;
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyBottomNavigation(),
                                ),
                              );
                              loginCubit.completeLogin();
                            }
                          }
                        },
                      ),
                      // Account Button
                      SizedBox(height: getMobileHeight(context, 20)),

                      MyDivider(),

                      SizedBox(height: getMobileHeight(context, 7)),
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
              SizedBox(height: getMobileHeight(context, 30)),
            ],
          ),
        ),
      ),
    );
  }
}
