import 'package:flutter/material.dart';
import 'package:fm_radio/Databases/live_database.dart';

class RecentCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const RecentCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imageUrl)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title, style: TextStyle(color: Colors.white)),
            Text(subtitle, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
