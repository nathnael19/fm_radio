import 'package:flutter/material.dart';

class LivePlayButtons extends StatelessWidget {
  const LivePlayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_circle, size: 56, color: Color(0xffFEF9F9)),
        ),
        SizedBox(width: 5),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            size: 24,
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: 5),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.calendar_month_outlined,
            size: 24,
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: 5),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffEDE4E6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 5.5,
              ),
              child: Text("Tip Creator"),
            ),
          ),
        ),
      ],
    );
  }
}
