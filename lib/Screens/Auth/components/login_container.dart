import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';

class LoginContainer extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onTap;
  const LoginContainer({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getMobileWidth(context, 16)),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff80011F),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getMobileFontSize(context, 44))),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getMobileHeight(context, 10),
              horizontal: getMobileWidth(context, 20)),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getMobileFontSize(context, 12),
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
