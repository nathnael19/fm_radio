import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfDownloads extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  final String length;
  final String other;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ListOfDownloads({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.length,
    required this.other,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(imageUrl)),
      title: Text(
        title,
        style: GoogleFonts.notoSansEthiopic(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: color,
        ),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            year,
            style: GoogleFonts.notoSansEthiopic(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: color,
            ),
          ),
          SizedBox(width: 10),
          Text(
            other,
            style: GoogleFonts.notoSansEthiopic(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: color,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "$length long",
            style: GoogleFonts.notoSansEthiopic(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: color,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(icon, size: 24.r, color: color),
      ),
    );
  }
}
