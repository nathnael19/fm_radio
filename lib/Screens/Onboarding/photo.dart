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
    );
  }
}
