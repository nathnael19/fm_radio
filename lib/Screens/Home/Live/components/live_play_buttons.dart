import 'package:ethio_fm_radio/Screens/Home/Live/today/today_card.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LivePlayButtons extends StatelessWidget {
  const LivePlayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_circle,
              size: getMobileFontSize(context, 52), color: Color(0xffFEF9F9)),
        ),
        SizedBox(width: getMobileWidth(context, 3)),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            size: getMobileFontSize(context, 24),
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: getMobileWidth(context, 3)),
        IconButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          icon: Icon(
            Icons.calendar_month_outlined,
            size: getMobileFontSize(context, 24),
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: getMobileWidth(context, 3)),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffEDE4E6),
            borderRadius: BorderRadius.circular(getMobileFontSize(context, 8)),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getMobileHeight(context, 8),
                  horizontal: getMobileWidth(context, 10)),
              child: Text(
                local.tip_creator_text,
                style: TextStyle(
                    fontSize: getMobileFontSize(context, 12),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(getMobileFontSize(context, 20))),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return SizedBox(
        height: getMobileHeight(context, 350),
        child: Padding(
          padding: EdgeInsets.all(getMobileFontSize(context, 5)),
          child: Column(
            children: [
              // Drag Handle & Cancel Button
              Stack(
                children: [
                  // Drag Handle (centered)
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: getMobileWidth(context, 60),
                      height: getMobileHeight(context, 5),
                      margin: EdgeInsets.only(
                          top: getMobileWidth(context, 8),
                          bottom: getMobileWidth(context, 12)),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(
                            getMobileFontSize(context, 10)),
                      ),
                    ),
                  ),
                  // Cancel button (top-right)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close_fullscreen_rounded),
                      ),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getMobileWidth(context, 8)),
                  child: Text(
                    "የዚህ ፕሮግራሞ ቀን", // Title text
                    style: TextStyle(
                      fontSize: getMobileFontSize(context, 16),
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getMobileHeight(context, 10)),

              // Content goes here
              TodayCard(
                imageUrl: "assets/images/girl2.png",
                title: "ታዲያስ አዲስ",
                time: "04:00 PM",
                icon: Icons.notifications,
                onTap: () {},
              ),
              TodayCard(
                imageUrl: "assets/images/girl2.png",
                title: "ታዲያስ አዲስ",
                time: "04:00 PM",
                icon: Icons.notifications,
                onTap: () {},
              ),
              SizedBox(height: getMobileHeight(context, 5)),
            ],
          ),
        ),
      );
    },
  );
}
