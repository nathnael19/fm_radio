import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  final String username;
  final String time;
  final String content;
  final int number;
  final VoidCallback onTap;
  final VoidCallback onMoreTap;

  const CommentCard({
    super.key,
    required this.username,
    required this.time,
    required this.content,
    required this.number,
    required this.onTap,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              time,
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
            Text(number.toString(), style: TextStyle(fontSize: 13.sp)),
            SizedBox(width: 4.w),
            IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.thumb_up_off_alt,
                size: 16.r,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 16.w),
            IconButton(
              onPressed: onMoreTap,
              icon: Icon(Icons.reply, size: 16.r, color: Colors.black54),
            ),
            Spacer(),
            Icon(Icons.more_vert, size: 18.r),
          ],
        ),
      ],
    );
  }
}
