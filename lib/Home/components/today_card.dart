import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final IconData icon;
  final VoidCallback onTap;
  const TodayCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: Offset(0, 1),
            blurRadius: 1.5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imageUrl,
                width: 170.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.notoSansEthiopic(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(time),
                ],
              ),
            ],
          ),
          Row(
            children: [IconButton(onPressed: onTap, icon: Icon(icon))],
          ),
        ],
      ),
    );
  }
}
