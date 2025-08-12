import 'package:ethio_fm_radio/Screens/Home/Live/recent/recent_card.dart';
import 'package:flutter/material.dart';

class RecentListCards extends StatelessWidget {
  final List recentPrograms;
  const RecentListCards({super.key, required this.recentPrograms});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: recentPrograms.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return RecentCard(
                imageUrl: recentPrograms[index][0],
                title: recentPrograms[index][1],
                subtitle: recentPrograms[index][2],
              );
            },
          ),
        ),
      ],
    );
  }
}
