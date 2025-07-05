import 'package:ethio_fm_radio/Auth/create_account.dart';
import 'package:ethio_fm_radio/Auth/forget_password_page.dart';
import 'package:ethio_fm_radio/Onboarding/photo.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:flutter/material.dart';

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
              MyPhoto(height: 247),

              const SizedBox(height: 27),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xff1A0101),
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Email/Phone input field
                    const Text(
                      "Email/Phone",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "Your answer",
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Password input field
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "***********",
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

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
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff001420),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyBottomNavigation(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff80011F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    //Sign up redirect link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff001420),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => const CreactAccountPage(),
                                builder: (context) => const CreactAccountPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff80011F),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
              // Title text
            ],
          ),
        ),
      ),
    );
  }
}
