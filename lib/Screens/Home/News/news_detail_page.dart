import 'package:ethio_fm_radio/Screens/Home/News/model/comment_model.dart';
import 'package:ethio_fm_radio/Screens/Home/News/news_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailPage extends StatefulWidget {
  bool isVisible;
  final String date;
  final String channel;
  final String imageUrl;
  final String title;
  final String content;
  final int likeNum;
  final int commentNum;
  final int shareNum;
  final List<Comment> comments;

  NewsDetailPage({
    super.key,
    this.isVisible = false,
    required this.date,
    required this.channel,
    required this.imageUrl,
    required this.title,
    required this.content,
    required this.likeNum,
    required this.commentNum,
    required this.shareNum,
    required this.comments,
  });

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85,
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: NewsDetailCard(
            commentsModel: widget.comments,
            initialShowComments: false,
            onMinimizeTapped: () {
              setState(() {
                widget.isVisible = false;
              });
            },
            onCommentTapped: () {
              setState(() {
                widget.isVisible = true;
              });
            },
            date: widget.date,
            channel: widget.channel,
            imageUrl: widget.imageUrl,
            title: widget.title,
            subtitle: widget.content,
            likes: widget.likeNum,
            comments: widget.commentNum,
            shares: widget.shareNum),
      ),
    );
  }
}
