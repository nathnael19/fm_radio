import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  final String username;
  final String time;
  final String content;
  final int number;
  final VoidCallback onMoreTap;
  final double xAxis;
  final double minus;
  final Color color;
  final VoidCallback onReplay;

  const CommentCard({
    super.key,
    required this.username,
    required this.time,
    required this.content,
    required this.onReplay,
    required this.number,
    required this.onMoreTap,
    required this.xAxis,
    required this.minus,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      alignment: Alignment(xAxis, 0),
      child: Container(
        color: color,
        width: MediaQuery.of(context).size.width - minus,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  username,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
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
                  // onPressed: animateContainer
                  onPressed: () {},
                  icon: Icon(
                    Icons.thumb_up_off_alt,
                    size: 16.r,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 16.w),
                InkWell(
                  onTap: onReplay,
                  child: Icon(Icons.reply, size: 16.r, color: Colors.black54),
                ),
                Spacer(),
                GestureDetector(
                  onTap: onMoreTap,
                  child: Icon(Icons.more_vert, size: 18.r),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
