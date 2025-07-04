import 'package:ethio_fm_radio/Databases/live_database.dart';
import 'package:ethio_fm_radio/Home/components/live_play_buttons.dart';
import 'package:ethio_fm_radio/Home/components/live_tabbar.dart';
import 'package:ethio_fm_radio/Home/components/overlay_play.dart';
import 'package:ethio_fm_radio/Home/components/side_contaier.dart';
import 'package:flutter/material.dart';

class LivePage extends StatefulWidget {
  final double mobileHeight;
  final double mobileWidth;
  const LivePage({
    super.key,
    required this.mobileHeight,
    required this.mobileWidth,
  });

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              width: widget.mobileWidth,
              height: widget.mobileHeight * 0.44,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  stops: [1, 8],
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff80011F), Color(0xff4A0000)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 9,
                    ),
                    height: 270,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 270,
                          margin: const EdgeInsets.only(right: 16, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                  "assets/images/girl.png",
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text("ታዲያስ አዲስ"),
                              const SizedBox(height: 4),
                              Image.asset("assets/images/soundwave.png"),
                              const SizedBox(height: 6),
                              LivePlayButtons(),
                            ],
                          ),
                        ),

                        ///
                        const SideContainer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            LiveTabBars(
              recentPrograms: recentPrograms,
              currency: currency,
              wheathers: wheathers,
              todaysProgram: todaysProgram,
            ),
          ],
        ),
        const OverlayPlay(
          imageUrl: "assets/images/girl.png",
          title: "ታዲያስ አዲስ",
        ),
      ],
    );
  }
}
