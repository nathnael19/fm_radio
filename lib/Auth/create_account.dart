import 'package:ethio_fm_radio/Auth/signin_page.dart';
import 'package:flutter/material.dart';

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
              Container(
                height: 170,
                decoration: BoxDecoration(
                  color: const Color(0xff80011F),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/back.png"),
                  ),
                ),
                child: Center(
                  child: Image.asset("assets/images/backover.png", width: 150),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.all(15),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Page title
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color(0xff1A0101),
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                      ),
                    ),

                    const SizedBox(height: 16),

                    //Full Name
                    const Text(
                      "Full Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: "Your Full Name",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Email
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Your Email",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    //Phone Number
                    const Text(
                      "Phone number",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Your Phone Number",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    //  Password
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Your Password",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    //Confirm Password
                    const Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "confirm your password",
                        hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        border: UnderlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Account Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff80011F),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Create account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          "or",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                            indent: 10,
                          ),
                        ),
                      ],
                    ),

                    // Already have account link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SigninPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xff80011F),
                            ),
                          ),
                        ),
                      ],
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
