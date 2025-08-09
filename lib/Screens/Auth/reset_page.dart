import 'dart:async'; // <-- Import for Timer
import 'package:ethio_fm_radio/Screens/Auth/components/login_container.dart';
import 'package:ethio_fm_radio/Screens/Auth/new_password_page.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnterCodePage extends StatefulWidget {
  final String phoneNumber; // Add phone number parameter

  const EnterCodePage({super.key, required this.phoneNumber});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  Timer? _timer;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _start = 60; // 60 seconds countdown
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SetNewPasswordPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter all 6 digits")),
      );
    }
  }

  void _resendCode() {
    if (_start == 0) {
      // Call your resend logic here (e.g. API)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification code resent')),
      );
      startTimer(); // Restart countdown after resend
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Fixed background image
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wavecurve.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Form content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getMobileWidth(context, 25)),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Text(
                          local.reset_page_title,
                          style: TextStyle(
                            fontSize: getMobileFontSize(context, 28),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: getMobileHeight(context, 10)),

                        // Subtitle with dynamic phone number
                        Text(
                          "${local.reset_page_desc} ${widget.phoneNumber}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getMobileFontSize(context, 16),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: getMobileHeight(context, 30)),

                        // OTP Inputs
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (index) {
                            return SizedBox(
                              width: getMobileWidth(context, 40),
                              height: getMobileHeight(context, 50),
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontSize: getMobileFontSize(context, 22)),
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: '*',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: getMobileFontSize(context, 22),
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
                        SizedBox(height: getMobileHeight(context, 30)),

                        // Confirm Button
                        LoginContainer(
                          onTap: _onConfirm,
                          title: local.confirm,
                        ),
                        SizedBox(height: getMobileHeight(context, 20)),

                        // Resend Code Button with countdown
                        GestureDetector(
                          onTap: _resendCode,
                          child: Text(
                            _start == 0
                                ? local.resend_text
                                : 'Resend in $_start s',
                            style: TextStyle(
                              fontSize: getMobileFontSize(context, 16),
                              color: _start == 0
                                  ? const Color(0xFF80011F)
                                  : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getMobileHeight(context, 150)),
              ],
            ),
          ),

          // Positioned SVGs
          Positioned(
            left: MediaQuery.of(context).size.width / 2 -
                getMobileWidth(context, 45),
            top: getMobileHeight(context, 260),
            child: SvgPicture.asset("assets/images/sss.svg"),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 -
                getMobileWidth(context, 18),
            top: getMobileHeight(context, 300),
            child: SvgPicture.asset("assets/images/checkk.svg"),
          ),
        ],
      ),
    );
  }
}
