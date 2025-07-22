import 'package:ethio_fm_radio/Screens/Home/News/comment_card.dart';
import 'package:ethio_fm_radio/Screens/constants/bottomsheettop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailCard extends StatefulWidget {
  final String date;
  final String channel;
  final String imageUrl;
  final String title;
  final String subtitle;
  final int likes;
  final int comments;
  final int shares;
  final VoidCallback onMinimizeTapped;
  final bool showComments;
  final VoidCallback onCommentTapped;
  const NewsDetailCard({
    super.key,
    required this.date,
    required this.channel,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.onCommentTapped,
    required this.onMinimizeTapped,
    this.showComments = false,
  });

  @override
  State<NewsDetailCard> createState() => _NewsDetailCardState();
}

class _NewsDetailCardState extends State<NewsDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottomSheetTopContainer,
        SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, size: 16.r, color: Colors.grey),
                  SizedBox(width: 5.w),
                  Text(
                    widget.date,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  SizedBox(width: 10.w),
                  Icon(Icons.radio, size: 16.r, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    widget.channel,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/soundwave.png", height: 30.h),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.pause_circle_filled,
                    size: 35.r,
                    color: Colors.black87,
                  ),
                ],
              ),
            ],
          ),
        ),

        ///content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // Title
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Colors.black,
                    height: 1.4.h,
                  ),
                ),
                SizedBox(height: 12.h),

                // Body Text
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.5.h,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.start,
                ),
                // showCommentSection(context),
              ],
            ),
          ),
        ),

        /////footer
        ///
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Column(
            children: [
              // Interaction Buttons
              Row(
                children: [
                  Text(widget.likes.toString(),
                      style: TextStyle(fontSize: 13.sp)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 20.r,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(widget.comments.toString(),
                      style: TextStyle(fontSize: 13.sp)),
                  IconButton(
                    onPressed: widget.onCommentTapped,
                    icon: Icon(
                      Icons.comment_outlined,
                      size: 20.r,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(widget.shares.toString(),
                      style: TextStyle(fontSize: 13.sp)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send_outlined,
                      size: 20.r,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),

              // Comment Field
            ],
          ),
        ),

        //////////////////////
        ///
        Expanded(
          flex: widget.showComments == false ? 0 : 1,
          child: widget.showComments == false
              ? Container(
                  height: 0,
                )
              : Column(
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
                            onPressed: widget.onMinimizeTapped,
                            icon: Icon(Icons.close_fullscreen_outlined),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: CommentCard(
                              onReplyTap: () {},
                              username: "@someone",
                              time: "2hr ago",
                              content:
                                  "Lorem ipsum dolor sit amet consectetur. Ultricies mauris blandit laoreet malesuada.",
                              number: 400,
                              onTap: () {},
                              onMoreTap: () {},
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 12.w,
            ),
            hintText: "Write a comment...",
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send, color: Colors.grey),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
