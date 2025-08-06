import 'package:ethio_fm_radio/Screens/Home/Live/components/today_card.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LivePlayButtons extends StatelessWidget {
  const LivePlayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_circle, size: 56.r, color: Color(0xffFEF9F9)),
        ),
        SizedBox(width: 3.w),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            size: 24.r,
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: 3.w),
        IconButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          icon: Icon(
            Icons.calendar_month_outlined,
            size: 24.r,
            color: Color(0xffFEF9F9),
          ),
        ),
        SizedBox(width: 3.w),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffEDE4E6),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              child: Text(
                local.tip_creator_text,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
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
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return SizedBox(
        height: 350.h,
        child: Padding(
          padding: EdgeInsets.all(5.0.r),
          child: Column(
            children: [
              // Drag Handle & Cancel Button
              Stack(
                children: [
                  // Drag Handle (centered)
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 60.w,
                      height: 5.h,
                      margin: EdgeInsets.only(top: 8.h, bottom: 12.h),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  // Cancel button (top-right)
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close_fullscreen_rounded),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    "የዚህ ፕሮግራሞ ቀን", // Title text
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

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
              SizedBox(height: 10.h),
            ],
          ),
        ),
      );
    },
  );
}
