import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/create_account.dart';
import 'package:ethio_fm_radio/Screens/Auth/forget_password_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
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

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyPhoto(height: getMobileHeight(context, 247)),
              SizedBox(height: getMobileHeight(context, 27)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getMobileFontSize(context, 16)),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        local.login_page_title,
                        style: TextStyle(
                          color: const Color(0xff1A0101),
                          fontSize:
                              getMobileFontSize(context, 36), // original 36.sp
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: getMobileHeight(context, 20)),
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
                      SizedBox(height: getMobileHeight(context, 16)),
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
                      SizedBox(height: getMobileHeight(context, 16)),
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
                              color: const Color(0xff001420),
                              fontSize: getMobileFontSize(
                                  context, 14), // original 14.sp
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: getMobileHeight(context, 16)),
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
                            loginCubit.completeLogin();
                          }
                        },
                      ),
                      SizedBox(height: getMobileHeight(context, 20)),
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
                      SizedBox(height: getMobileHeight(context, 30)),
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
