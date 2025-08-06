import 'package:ethio_fm_radio/Screens/constants/app_color.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';

class NewsPageCardSmall extends StatelessWidget {
  final String title;
  final String channel;
  final String date;
  final VoidCallback onTap;
  final VoidCallback onMore;
  final String imageUrl;
  const NewsPageCardSmall({
    super.key,
    required this.title,
    required this.channel,
    required this.date,
    required this.onTap,
    required this.onMore,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final appColor = AppColor();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getMobileHeight(context, 81),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(getMobileFontSize(context, 8)),
            border: Border.all(color: appColor.borderColor, width: 1)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(getMobileFontSize(context, 8)),
              width: getMobileWidth(context, 65),
              height: getMobileHeight(context, 65),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
                borderRadius:
                    BorderRadius.circular(getMobileFontSize(context, 8)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: getMobileFontSize(context, 8),
                  top: getMobileFontSize(context, 8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: title,
                        style: TextStyle(
                            fontSize: getMobileFontSize(context, 15),
                            color: appColor.titleTextColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "📰",
                              style: TextStyle(
                                fontSize: getMobileFontSize(context, 12),
                                color: appColor.titleTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: getMobileWidth(context, 5),
                            ),
                            Text(
                              channel,
                              style: TextStyle(
                                fontSize: getMobileFontSize(context, 12),
                                color: appColor.titleTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: getMobileWidth(context, 20),
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: getMobileFontSize(context, 12),
                                color: appColor.titleTextColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: onMore, child: Icon(Icons.more_vert))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
