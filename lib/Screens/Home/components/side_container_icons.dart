import 'package:ethio_fm_radio/Screens/constants/screen_utils.dart';
import 'package:flutter/material.dart';

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
          icon: Icon(
            icon,
            size: getResponsiveSize(context, 24, isHeight: true),
            color: Colors.white,
          ),
        ),
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: getResponsiveSize(context, 10, isHeight: true),
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
