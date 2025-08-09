import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/create_account.dart'; // Ensure correct file name
import 'package:ethio_fm_radio/Screens/Auth/cubit/user_cubit.dart';
import 'package:ethio_fm_radio/Screens/Auth/forget_password_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/Screens/constants/app_color.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/Screens/main/bottom_navigation.dart';
import 'package:ethio_fm_radio/cubit/login/login_cubit.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final appColor = AppColor();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPhoto(height: getMobileHeight(context, 247)),
                SizedBox(height: getMobileHeight(context, 27)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getMobileFontSize(context, 16),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          local.login_page_title,
                          style: TextStyle(
                            color: appColor.titleTextColor,
                            fontSize: getMobileFontSize(context, 36),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: getMobileHeight(context, 20)),
                        MyTextField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                    .hasMatch(value)) {
                              return local.form_email_error;
                            }
                            return null;
                          },
                          hint: local.email,
                          controller: emailController,
                        ),
                        SizedBox(height: getMobileHeight(context, 16)),
                        MyTextField(
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8) {
                              return local.form_pass_error;
                            }
                            return null;
                          },
                          hint: local.password,
                          controller: passwordController,
                          isPass: true,
                        ),
                        SizedBox(height: getMobileHeight(context, 16)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ForgotPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              local.forgot_password_text,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff001420),
                                fontSize: getMobileFontSize(context, 14),
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: getMobileHeight(context, 16)),
                        BlocConsumer<UserCubit, UserState>(
                          listener: (context, state) {
                            if (state is UserFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.msg)),
                              );
                            }
                            if (state is UserLoaded) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MyBottomNavigation(),
                                ),
                              );
                              LoginCubit().completeLogin();
                            }
                          },
                          builder: (context, state) {
                            if (state is UserLoading) {
                              return LoginContainer(
                                title: "",
                                onTap: () {},
                                isLoading: true,
                              );
                            }

                            return LoginContainer(
                              title: local.login_text,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  final email = emailController.text.trim();
                                  final password =
                                      passwordController.text.trim();

                                  // Debug print on tap
                                  print('Login tapped with email: $email');

                                  context.read<UserCubit>().loginUser(
                                        email: email,
                                        password: password,
                                      );
                                } else {
                                  print('Form validation failed');
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: getMobileHeight(context, 20)),
                        TextContainer(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CreactAccountPage(),
                              ),
                            );
                          },
                          leftText: local.signup_question,
                          rightText: local.signup_text,
                        ),
                        SizedBox(height: getMobileHeight(context, 30)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
