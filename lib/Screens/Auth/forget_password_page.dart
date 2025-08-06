import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_divider.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/my_text_field.dart';
import 'package:ethio_fm_radio/Screens/Auth/components/text_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/reset_page.dart';
import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/Onboarding/photo.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController phoneController = TextEditingController();

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
              MyPhoto(height: getMobileHeight(context, 401)),

              SizedBox(height: getMobileHeight(context, 27)),

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
                        local.forgot_page_title,
                        style: TextStyle(
                          color: Color(0xff1A0101),
                          fontSize: getMobileFontSize(context, 36),
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: getMobileHeight(context, 14)),

                      //Subtitle
                      Text(
                        local.forgot_page_desc,
                        style: TextStyle(
                          fontSize: getMobileFontSize(context, 16),
                          fontWeight: FontWeight.w500,
                          color: Color(0xff001420),
                        ),
                      ),

                      SizedBox(height: getMobileHeight(context, 14)),

                      // Phone number field
                      MyTextField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]').hasMatch(value) ||
                              value.length != 10) {
                            return local.form_phone_error;
                          } else {
                            return null;
                          }
                        },
                        hint: local.phone_number,
                        controller: phoneController,
                      ),

                      SizedBox(height: getMobileHeight(context, 14)),

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

                      SizedBox(height: getMobileHeight(context, 16)),
                      MyDivider(),
                      SizedBox(height: getMobileHeight(context, 16)),

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
