import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatefulWidget {
  final String date;
  final String channel;
  final String imageUrl;
  final String title;
  final String subtitle;
  final int likes;
  final int comments;
  final int shares;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.date,
    required this.channel,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.onTap,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        height: 355.h,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffEDE4E6), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.date,
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Icon(
                    Icons.rectangle,
                    size: 10.r,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    widget.channel,
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: isPlaying
                        ? Row(
                            children: [
                              Image.asset("assets/images/soundwave.png",
                                  height: 30.h),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isPlaying = !isPlaying;
                                  });
                                },
                                child: Icon(
                                  Icons.pause_circle_filled,
                                  size: 32.r,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                            child: Icon(
                              Icons.play_circle,
                              size: 32.r,
                              color: Colors.black87,
                            ),
                          ),
                  ),
                ],
              ),
              Image.asset(
                width: 331.w,
                height: 160.h,
                fit: BoxFit.fitWidth,
                widget.imageUrl,
              ),
              Text(widget.title,
                  style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color(0xff1A0101))),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                widget.subtitle,
                style: GoogleFonts.notoSansEthiopic(
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                  color: Color(0xff4B4242),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    widget.likes.toString(),
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Color(0xff1A0101),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.thumb_up,
                        size: 24.r,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    widget.comments.toString(),
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Color(0xff1A0101),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 24.r,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    widget.shares.toString(),
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Color(0xff1A0101),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.share,
                        size: 24.r,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.bookmark,
                        size: 24.r,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
