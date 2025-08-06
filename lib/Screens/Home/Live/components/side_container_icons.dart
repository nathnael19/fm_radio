import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
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
            size: getMobileFontSize(context, 24),
            color: Colors.white,
          ),
        ),
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: getMobileFontSize(context, 10),
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
