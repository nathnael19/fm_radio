import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isPass;
  const MyTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isPass = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            fontFamily: "Poppins",
            color: Color(0xff648CA3),
          ),
        ),

        TextField(
          controller: controller,
          obscureText: isPass ? true : false,
          decoration: InputDecoration(
            hintText: isPass ? "***********" : "Your answer",
            border: UnderlineInputBorder(),
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 11.sp,
              fontFamily: "Poppins",
              color: Color(0xff648CA3),
            ),
          ),
        ),
      ],
    );
  }
}
