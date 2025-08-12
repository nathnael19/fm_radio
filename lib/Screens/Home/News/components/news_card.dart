import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
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
        margin: EdgeInsets.symmetric(
            horizontal: getMobileWidth(context, 10),
            vertical: getMobileHeight(context, 10)),
        height: getMobileHeight(context, 335),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffEDE4E6), width: 1),
          borderRadius: BorderRadius.circular(getMobileFontSize(context, 10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(getMobileFontSize(context, 16)),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.date,
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: getMobileFontSize(context, 10),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: getMobileWidth(context, 20),
                  ),
                  Icon(
                    Icons.rectangle,
                    size: getMobileFontSize(context, 10),
                  ),
                  SizedBox(
                    width: getMobileWidth(context, 5),
                  ),
                  Text(
                    widget.channel,
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: getMobileFontSize(context, 10),
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: isPlaying
                        ? Row(
                            children: [
                              Image.asset("assets/images/soundwave.png",
                                  height: getMobileHeight(context, 30)),
                              SizedBox(width: getMobileHeight(context, 10)),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isPlaying = !isPlaying;
                                  });
                                },
                                child: Icon(
                                  Icons.pause_circle_filled,
                                  size: getMobileFontSize(context, 32),
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
                              size: getMobileFontSize(context, 32),
                              color: Colors.black87,
                            ),
                          ),
                  ),
                ],
              ),
              Image.asset(
                width: getMobileWidth(context, 330),
                height: getMobileHeight(context, 153),
                fit: BoxFit.fitWidth,
                widget.imageUrl,
              ),
              Text(widget.title,
                  style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w500,
                      fontSize: getMobileFontSize(context, 16),
                      color: Color(0xff1A0101))),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                widget.subtitle,
                style: GoogleFonts.notoSansEthiopic(
                  fontWeight: FontWeight.w300,
                  fontSize: getMobileFontSize(context, 11),
                  color: Color(0xff4B4242),
                ),
              ),
              SizedBox(
                height: getMobileHeight(context, 5),
              ),
              Row(
                children: [
                  Text(
                    widget.likes.toString(),
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: getMobileFontSize(context, 10),
                      color: Color(0xff1A0101),
                    ),
                  ),
                  SizedBox(
                    width: getMobileHeight(context, 5),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.thumb_up,
                        size: getMobileFontSize(context, 24),
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    widget.comments.toString(),
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: getMobileFontSize(context, 10),
                      color: Color(0xff1A0101),
                    ),
                  ),
                  SizedBox(
                    width: getMobileWidth(context, 5),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: getMobileFontSize(context, 24),
                      )),
                  SizedBox(
                    width: getMobileWidth(context, 10),
                  ),
                  Text(
                    widget.shares.toString(),
                    style: GoogleFonts.notoSansEthiopic(
                      fontWeight: FontWeight.w400,
                      fontSize: getMobileFontSize(context, 10),
                      color: Color(0xff1A0101),
                    ),
                  ),
                  SizedBox(
                    width: getMobileWidth(context, 5),
                  ),
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.share,
                        size: getMobileFontSize(context, 24),
                      )),
                  SizedBox(
                    width: getMobileWidth(context, 10),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.bookmark,
                      size: getMobileFontSize(context, 24),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
