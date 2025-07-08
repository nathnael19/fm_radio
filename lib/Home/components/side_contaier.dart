import 'package:ethio_fm_radio/Home/components/side_container_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideContainer extends StatelessWidget {
  const SideContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 256.h,
      margin: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(55.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SideContainerIcon(icon: Icons.abc, number: 400, onTap: () {}),
          SideContainerIcon(
            icon: Icons.message_outlined,
            number: 400,
            onTap: () {},
          ),
          SideContainerIcon(
            icon: FontAwesomeIcons.share,
            number: 400,
            onTap: () {},
          ),
          SideContainerIcon(icon: Icons.bookmark, number: 400, onTap: () {}),
        ],
      ),
    );
  }
}
