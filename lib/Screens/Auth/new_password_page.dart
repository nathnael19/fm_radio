import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

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
    final formKey = GlobalKey<FormState>();
    String passError = local.form_pass_error;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header image + logo
              MyPhoto(height: getMobileHeight(context, 401)),

              SizedBox(height: getMobileHeight(context, 30)),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getMobileWidth(context, 16)),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        local.new_pass_page_title,
                        style: TextStyle(
                          color: Color(0xff1A0101),
                          fontSize: getMobileFontSize(context, 36),
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: getMobileHeight(context, 16)),

                      // New password input
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]').hasMatch(value) ||
                              value.length != 10) {
                            return passError;
                          } else {
                            return null;
                          }
                        },
                        hint: local.new_pass,
                        controller: newPasswordController,
                      ),
                      SizedBox(height: getMobileHeight(context, 16)),

                      // Confirm password input
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]').hasMatch(value) ||
                              value.length != 10) {
                            return passError;
                          } else {
                            return null;
                          }
                        },
                        hint: local.new_conf_pass,
                        controller: confirmPasswordController,
                      ),

                      SizedBox(height: getMobileHeight(context, 16)),

                      // Reset password button
                      LoginContainer(
                        title: local.continue_text,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              setState(() {
                                passError = local.form_pass_error2;
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninPage(),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: getMobileHeight(context, 24)),
                      MyDivider(),
                      SizedBox(height: getMobileHeight(context, 14)),
                    ],
                  ),
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
              SizedBox(height: getMobileHeight(context, 10)),
            ],
          ),
        ),
      ),
    );
  }
}
