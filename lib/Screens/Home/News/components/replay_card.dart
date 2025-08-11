import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReplayCard extends StatelessWidget {
  final String username;
  final String content;
  final String timeStamp;
  final int likes;
  const ReplayCard(
      {super.key,
      required this.username,
      required this.content,
      required this.timeStamp,
      required this.likes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Username and Time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            Text(
              timeStamp,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        // Comment content
        Text(content, style: TextStyle(fontSize: 14.sp)),
        // Likes, Reply, Menu
        Row(
          children: [
            Text(likes.toString(), style: TextStyle(fontSize: 13.sp)),
            SizedBox(width: 4.w),
            IconButton(
              // onPressed: animateContainer
              onPressed: () {},
              icon: Icon(
                Icons.thumb_up_off_alt,
                size: 16.r,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
