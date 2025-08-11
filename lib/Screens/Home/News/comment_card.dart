import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatefulWidget {
  final String username;
  final String time;
  final String content;
  final int number;
  final VoidCallback onMoreTap;

  const CommentCard({
    super.key,
    required this.username,
    required this.time,
    required this.content,
    required this.number,
    required this.onMoreTap,
  });

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  double x_axis = 0;
  double minus = 0;
  Color color = Colors.white;

  void anim() {
    setState(() {
      x_axis = 0.5;
      minus = 100;
      color = Colors.grey.shade50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      alignment: Alignment(x_axis, 0),
      child: Container(
        color: color,
        width: MediaQuery.of(context).size.width - minus,
        // width: 200,
        // height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.username,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
                Text(
                  widget.time,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            // Comment content
            Text(widget.content, style: TextStyle(fontSize: 14.sp)),
            // Likes, Reply, Menu
            Row(
              children: [
                Text(widget.number.toString(),
                    style: TextStyle(fontSize: 13.sp)),
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
                  onTap: anim,
                  child: Icon(Icons.reply, size: 16.r, color: Colors.black54),
                ),
                Spacer(),
                GestureDetector(
                  onTap: widget.onMoreTap,
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
