import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LivePlayButtons extends StatelessWidget {
  const LivePlayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_circle, size: 56.r, color: Color(0xffFEF9F9)),
        ),
        SizedBox(width: 3.w),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            size: 24.r,
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: 3.w),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.calendar_month_outlined,
            size: 24.r,
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: 3.w),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffEDE4E6),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              child: Text(
                "Tip Creator",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
