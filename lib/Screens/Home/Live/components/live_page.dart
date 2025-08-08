import 'package:ethio_fm_radio/Databases/live_database.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/components/live_play_buttons.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/components/live_tabbar.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/components/side_contaier.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  const LivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: getMobileWidth(context, 390),
          height: getMobileHeight(context, 330),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff80011F), Color(0xff4A0000)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(getMobileWidth(context, 40)),
              bottomRight: Radius.circular(getMobileWidth(context, 40)),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: getMobileWidth(context, 20),
              right: getMobileWidth(context, 20),
              top: getMobileHeight(context, 10),
            ),
            height: getMobileHeight(context, 288),
            width: getMobileWidth(context, 344),
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
      height: getMobileHeight(context, 256),
      width: getMobileWidth(context, 272),
      margin: EdgeInsets.only(
          right: getMobileWidth(context, 16),
          top: getMobileHeight(context, 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: getMobileFontSize(context, 40),
            backgroundImage: AssetImage("assets/images/girl.png"),
          ),
          SizedBox(height: getMobileHeight(context, 6)),
          Text(
            "ታዲያስ አዲስ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: getMobileFontSize(context, 14),
            ),
          ),
          SizedBox(height: getMobileHeight(context, 8)),
          Image.asset(
            "assets/images/soundwave.png",
            width: getMobileWidth(context, 123),
            height: getMobileHeight(context, 42),
          ),
          LivePlayButtons(),
        ],
      ),
    );
  }
}
