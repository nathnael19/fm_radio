import 'package:ethio_fm_radio/Home/components/today_card.dart';
import 'package:flutter/material.dart';

class TodaysListCards extends StatelessWidget {
  final List todaysProgram;
  const TodaysListCards({super.key, required this.todaysProgram});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todaysProgram.length,
            itemBuilder: (context, index) {
              return TodayCard(
                icon: Icons.notifications,
                imageUrl: "assets/images/girl3.png",
                onTap: () {},
                title: "ታድያስ አዲስ",
                time: "04:00 PM",
              );
            },
          ),
        ),
      ],
    );
  }
}
