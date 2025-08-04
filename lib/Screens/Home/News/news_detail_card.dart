import 'package:ethio_fm_radio/Screens/Home/News/comment_bottom_sheet.dart';
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
  final VoidCallback onCommentTapped;
  final bool initialShowComments;

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
    this.initialShowComments = false,
  });

  @override
  State<NewsDetailCard> createState() => _NewsDetailCardState();
}

class _NewsDetailCardState extends State<NewsDetailCard> {
  late bool showComments;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _commentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    showComments = widget.initialShowComments;
  }

  @override
  void didUpdateWidget(covariant NewsDetailCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.initialShowComments && widget.initialShowComments) {
      setState(() {
        showComments = widget.initialShowComments;
      });
      _scrollToComments();
    }
  }

  void _scrollToComments() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox =
          _commentKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero,
            ancestor: context.findRenderObject());
        final scrollableBox = context.findRenderObject() as RenderBox;
        final offset = _scrollController.offset +
            position.dy -
            scrollableBox.localToGlobal(Offset.zero).dy +
            150;
        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _toggleComments(bool show) {
    setState(() {
      showComments = show;
    });
    if (show) {
      _scrollToComments();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _interactionRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(widget.likes.toString(), style: TextStyle(fontSize: 13.sp)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.thumb_up_alt_outlined,
                size: 20.r, color: Colors.grey),
          ),
          SizedBox(width: 10.w),
          Text(widget.comments.toString(), style: TextStyle(fontSize: 13.sp)),
          IconButton(
            onPressed: () {
              _toggleComments(true);
              widget.onCommentTapped();
            },
            icon: Icon(Icons.comment_outlined, size: 20.r, color: Colors.grey),
          ),
          SizedBox(width: 16.w),
          Text(widget.shares.toString(), style: TextStyle(fontSize: 13.sp)),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send_outlined, size: 20.r, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bottomSheetTopContainer,
        if (!showComments) ...[
          _header(),
        ],
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showComments) ...[
                  // bottomSheetTopContainer,
                  _header(),
                ],
                _content(),
                if (showComments) ...[
                  SizedBox(height: 16.h),
                  _interactionRow(),
                  SizedBox(height: 24.h),
                  Container(
                    key: _commentKey,
                    child: CommentBottomSheet(onTap: () {
                      _toggleComments(false);
                    }),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (!showComments) _interactionRow(),
        _footer(),
      ],
    );
  }

  Widget _footer() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 12.w,
          ),
          hintText: "comment...",
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
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: Colors.black,
            height: 1.4,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          widget.subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            height: 1.5,
            color: Colors.black87,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 16.h),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.access_time, size: 16.r, color: Colors.grey),
                SizedBox(width: 5.w),
                Text(widget.date,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                SizedBox(width: 10.w),
                Icon(Icons.radio, size: 16.r, color: Colors.grey),
                SizedBox(width: 5.w),
                Text(widget.channel,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
            Row(
              children: [
                Image.asset("assets/images/soundwave.png", height: 30.h),
                SizedBox(width: 10.w),
                Icon(Icons.pause_circle_filled,
                    size: 35.r, color: Colors.black87),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
