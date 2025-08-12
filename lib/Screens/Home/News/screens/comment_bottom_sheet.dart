import 'package:ethio_fm_radio/Screens/Home/News/components/comment_card.dart';
import 'package:ethio_fm_radio/Screens/Home/News/components/replay_card.dart';
import 'package:ethio_fm_radio/Screens/Home/News/model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentBottomSheet extends StatefulWidget {
  final VoidCallback onTap;
  final List<Comment> comments;
  const CommentBottomSheet({
    super.key,
    required this.onTap,
    required this.comments,
  });

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  int? animatedIndex;

  void toggleAnim(int index) {
    setState(() {
      if (animatedIndex == index) {
        animatedIndex = null;
      } else {
        animatedIndex = index;
      }
    });
  }

  void resetAnimation() {
    if (animatedIndex != null) {
      setState(() {
        animatedIndex = null;
      });
    }
  }

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
                  onPressed: () {
                    resetAnimation();
                    widget.onTap();
                  },
                  icon: const Icon(Icons.close_fullscreen_outlined),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
              itemCount: widget.comments.length,
              itemBuilder: (context, index) {
                final comment = widget.comments[index];

                final isAnimated = animatedIndex == index;
                final minus = isAnimated ? 80.0 : 0.0;
                final xAxis = isAnimated ? 0.5 : 0.0;
                final color = isAnimated ? Colors.grey.shade50 : Colors.white;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: CommentCard(
                        username: comment.username,
                        time: comment.timestamp,
                        content: comment.comment,
                        number: 50,
                        minus: minus,
                        xAxis: xAxis,
                        color: color,
                        onReplay: () => toggleAnim(index),
                        onMoreTap: () {
                          resetAnimation();
                          // your onMoreTap logic here
                        },
                      ),
                    ),
                    if (isAnimated && comment.replies.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: comment.replies.length,
                          itemBuilder: (context, replyIndex) {
                            final replay = comment.replies[replyIndex];
                            return Container(
                              margin: EdgeInsets.only(left: 20.h),
                              child: ReplayCard(
                                username: replay.username ?? '',
                                timeStamp: replay.timestamp ?? '',
                                content: replay.comment ?? '',
                                likes: replay.likes!,
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
