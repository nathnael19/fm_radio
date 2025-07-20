import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 0.5, color: Colors.grey, endIndent: 10),
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
          child: Divider(thickness: 0.5, color: Colors.grey, indent: 10),
        ),
      ],
    );
  }
}
