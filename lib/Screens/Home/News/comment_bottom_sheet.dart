import 'package:ethio_fm_radio/Screens/Home/News/comment_card.dart';
import 'package:ethio_fm_radio/Screens/Home/News/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentBottomSheet extends StatefulWidget {
  final VoidCallback onTap;
  final List<Comment> comments;
  const CommentBottomSheet(
      {super.key, required this.onTap, required this.comments});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      child: Column(
        children: [
          // Title
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "የህዝብ አስተያየት",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                IconButton(
                  onPressed: widget.onTap,
                  icon: Icon(Icons.close_fullscreen_outlined),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),

          // Comment list
          Container(decoration: BoxDecoration()),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.comments.length,
              itemBuilder: (context, index) {
                final comment = widget.comments[index];
                return Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: CommentCard(
                    onReplyTap: () {},
                    username: comment.username,
                    time: comment.timestamp,
                    content: comment.comment,
                    number: 50,
                    onTap: () {},
                    onMoreTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
