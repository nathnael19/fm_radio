import 'package:ethio_fm_radio/Databases/live_database.dart';
import 'package:ethio_fm_radio/Screens/Home/components/live_play_buttons.dart';
import 'package:ethio_fm_radio/Screens/Home/components/live_tabbar.dart';
import 'package:ethio_fm_radio/Screens/Home/components/side_contaier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390.w,
          height: 330.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff80011F), Color(0xff4A0000)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r),
              bottomRight: Radius.circular(40.r),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              bottom: 9.h,
              top: 12.h,
            ),
            height: 288.h,
            width: 344.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [LeftContainer(), SideContainer()],
            ),
          ),
        ),
        // Use Flexible to avoid nested Expanded errors
        Flexible(
          child: LiveTabBars(
            recentPrograms: recentPrograms,
            currency: currency,
            wheathers: wheathers,
            todaysProgram: todaysProgram,
          ),
        ),
      ],
    );
  }
}

class LeftContainer extends StatelessWidget {
  const LeftContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.h,
      width: 272.w,
      margin: EdgeInsets.only(right: 16.w, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundImage: AssetImage("assets/images/girl.png"),
          ),
          SizedBox(height: 6.h),
          Text(
            "ታዲያስ አዲስ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Image.asset(
            "assets/images/soundwave.png",
            width: 123.w,
            height: 42.h,
          ),
          LivePlayButtons(),
        ],
      ),
    );
  }
}
