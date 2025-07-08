import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideContainerIcon extends StatelessWidget {
  final int number;
  final IconData icon;
  final VoidCallback onTap;
  const SideContainerIcon({
    super.key,
    required this.number,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon, size: 24.r, color: Colors.white),
        ),
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
