import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGroupChat extends StatelessWidget {
  const MyGroupChat({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Group 1", style: TextStyle(fontSize: 17.sp)),
            Text(
              "1.2k ${local.group_page_members}",
              style: TextStyle(fontSize: 13.sp),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Start writing",
            suffix: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GroupChatContainer(
              isSender: true,
              noDislike: 20,
              noLike: 105,
              time: 2,
              content:
                  "Lorem ipsum dolor sit amet consectetur. Sit suspendisse sit lacinia tellus in posuere purus rhoncus aenean. Cum pharetra donec leo tristique tellus pharetra pellentesque duis. Interdum cursus lectus elit ipsum laoreet habitant fermentum. Felis amet aliquet justo egestas. Lobortis quis ut sit consequat amet.",
            ),
            GroupChatContainer(
              isSender: false,
              noDislike: 20,
              noLike: 105,
              time: 2,
              username: "@username",
              content:
                  "Lorem ipsum dolor sit amet consectetur. Sit suspendisse sit lacinia tellus in posuere purus rhoncus aenean. Cum pharetra donec leo tristique tellus pharetra pellentesque duis. Interdum cursus lectus elit ipsum laoreet habitant fermentum. Felis amet aliquet justo egestas. Lobortis quis ut sit consequat amet.",
            ),
            GroupChatContainer(
              isSender: true,
              noDislike: 20,
              noLike: 105,
              time: 2,
              content:
                  "Lorem ipsum dolor sit amet consectetur. Sit suspendisse sit lacinia tellus in posuere purus rhoncus aenean. Cum pharetra donec leo tristique tellus pharetra pellentesque duis. Interdum cursus lectus elit ipsum laoreet habitant fermentum. Felis amet aliquet justo egestas. Lobortis quis ut sit consequat amet.",
            ),
          ],
        ),
      ),
    );
  }
}

class GroupChatContainer extends StatelessWidget {
  final int time;
  final String content;
  final int noLike;
  final int noDislike;
  final bool isSender;
  final String username;

  const GroupChatContainer({
    super.key,
    required this.time,
    required this.content,
    required this.noLike,
    required this.noDislike,
    required this.isSender,
    this.username = "me",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xEDE4E6D1), width: 1.w),

        borderRadius: BorderRadius.circular(8.r),
        color: isSender ? Color(0xEDE4E6D1) : Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 15.r),
                  SizedBox(width: 10.w),
                  Text(username),
                ],
              ),
              Text("${time.toString()} hr ago"),
            ],
          ),
          SizedBox(height: 10.h),
          Text(content),
          Row(
            children: [
              Text(noLike.toString()),
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
              SizedBox(width: 20.w),
              Text(noDislike.toString()),
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_down)),
            ],
          ),
        ],
      ),
    );
  }
}
