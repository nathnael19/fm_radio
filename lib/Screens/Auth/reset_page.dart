import 'dart:async'; // <-- Import for Timer
import 'package:ethio_fm_radio/Screens/Auth/new_password_page.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  Timer? _timer;
  int _start = 0; // Countdown seconds

  @override
  void initState() {
    super.initState();
    startTimer(); // 🔥 Start countdown when the page is loaded
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
      startTimer(); // Start countdown after resend
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
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Text(
                          local.reset_page_title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Subtitle
                        Text(
                          "${local.reset_page_desc} +251 91 234 567",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // OTP Inputs
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
                                style: TextStyle(fontSize: 22.sp),
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText: '*',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 22.sp,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
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

                        // Confirm Button
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
                            onPressed: _onConfirm,
                            child: Text(
                              local.confirm,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Resend Code Button with countdown
                        GestureDetector(
                          onTap: _resendCode,
                          child: Text(
                            _start == 0
                                ? local.resend_text
                                : 'Resend in $_start s',
                            style: TextStyle(
                              fontSize: 16,
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
                SizedBox(height: 150.h),
              ],
            ),
          ),

          // Positioned SVGs
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 45.w,
            top: 260.h,
            child: SvgPicture.asset("assets/images/sss.svg"),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 22.w,
            top: 290.h,
            child: SvgPicture.asset("assets/images/checkk.svg"),
          ),
        ],
      ),
    );
  }
}
