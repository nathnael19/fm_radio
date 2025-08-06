import 'package:ethio_fm_radio/Screens/constants/app_color.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';

class NewsPageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String channel;
  final VoidCallback onTap;
  const NewsPageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.channel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppColor myColor = AppColor();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getMobileHeight(context, 245),
        width: getMobileWidth(context, 330),
        decoration: BoxDecoration(
            border: Border.all(color: myColor.borderColor),
            color: Colors.white,
            borderRadius: BorderRadius.circular(getMobileFontSize(context, 8))),
        child: Column(
          children: [
            Container(
              height: getMobileHeight(context, 160),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getMobileFontSize(context, 8)),
                      topRight: Radius.circular(
                        getMobileFontSize(context, 8),
                      )),
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.fitWidth)),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getMobileFontSize(context, 5),
                  horizontal: getMobileFontSize(context, 8),
                ),
                child: RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: title,
                      style: TextStyle(
                          fontSize: getMobileFontSize(context, 15),
                          color: myColor.titleTextColor,
                          fontWeight: FontWeight.w600),
                    ))),
            Padding(
              padding: EdgeInsets.only(
                left: getMobileFontSize(context, 8),
                right: getMobileFontSize(context, 8),
              ),
              child: Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: getMobileFontSize(context, 12),
                        color: myColor.titleTextColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: getMobileFontSize(context, 15),
                  ),
                  Text(
                    "📰",
                    style: TextStyle(
                        fontSize: getMobileFontSize(context, 12),
                        color: myColor.titleTextColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: getMobileFontSize(context, 8),
                  ),
                  Text(
                    channel,
                    style: TextStyle(
                        fontSize: getMobileFontSize(context, 12),
                        color: myColor.titleTextColor,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
