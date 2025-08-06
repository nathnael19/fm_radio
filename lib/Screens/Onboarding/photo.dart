import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';

class MyPhoto extends StatelessWidget {
  final double height;
  const MyPhoto({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(getMobileFontSize(context, 30)),
          bottomRight: Radius.circular(getMobileFontSize(context, 30)),
        ),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/back.png"),
        ),
      ),
      child: Center(
        child: Image.asset("assets/images/backover.png",
            width: getMobileWidth(context, 150)),
      ),
    );
  }
}
