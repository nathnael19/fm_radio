import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String leftText;
  final String rightText;
  const TextContainer({
    super.key,
    required this.onTap,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$leftText ",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: getMobileFontSize(context, 16),
            color: Color(0xff001420),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            rightText,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xff80011F),
              fontSize: getMobileFontSize(context, 16),
              decorationColor: Color(0xff80011F),
              decorationThickness: 2,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
