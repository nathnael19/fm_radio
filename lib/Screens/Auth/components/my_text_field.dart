import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPass;
  final String? Function(String?)? validator;
  const MyTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPass = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: getMobileFontSize(context, 12),
            fontFamily: "Poppins",
            color: Color(0xff648CA3),
          ),
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: isPass ? true : false,
          decoration: InputDecoration(
            hintText: isPass ? "***********" : local.your_answer_text,
            border: UnderlineInputBorder(),
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: getMobileFontSize(context, 11),
              fontFamily: "Poppins",
              color: Color(0xff648CA3),
            ),
          ),
        ),
      ],
    );
  }
}
