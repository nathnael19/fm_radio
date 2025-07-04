import 'package:ethio_fm_radio/Auth/signin_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: EnterCodePage()),
  );
}

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({super.key});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _onConfirm() {
    String code = _controllers.map((e) => e.text).join();
    if (code.length == 6) {
      print("Entered Code: $code");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Code entered: $code")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter all 6 digits")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF80011F), Color(0xFFA00025)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(300, 0),
                bottomRight: Radius.elliptical(300, 0),
              ),
            ),
          ),
          // Foreground Content
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Checkmark Icon
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF80011F), width: 7),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Color(0xFF80011F),
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Title
                  const Text(
                    "Enter code",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  //Subtitle
                  const Text(
                    "A reset code has been sent to +251 91 234 567",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),

                  // Functional OTP Inputs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 40,
                        height: 50,
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: '*', // Placeholder
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF80011F),
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (value) => _onChanged(value, index),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 30),

                  //  Confirm Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF80011F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext) => const SigninPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Resend Code
                  GestureDetector(
                    onTap: () {
                      // Handle resend logic here
                    },
                    child: const Text(
                      "Resend code?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF80011F),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
