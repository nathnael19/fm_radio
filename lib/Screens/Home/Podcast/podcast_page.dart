import 'package:audioplayers/audioplayers.dart';
import 'package:ethio_fm_radio/Databases/live_database.dart';
import 'package:ethio_fm_radio/Screens/Home/Podcast/podcast_detail_page.dart';
import 'package:ethio_fm_radio/Screens/Home/components/recent_card.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({super.key});

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  late AudioPlayer audioPlayer;
  List recent = recentPrograms;
  List<String> paths = [
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
  ];

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff80011F),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            height: 15.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Column(
                children: [
                  sectionHeader(local.only_fm, paths[0],
                      local.home_page_news_page_open_all),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PodcastDetailPage(
                                audioPlayer: audioPlayer,
                                path: paths[index],
                              ),
                            ),
                          );
                        },
                        child: RecentCard(
                          imageUrl: recent[index][0],
                          title: recent[index][1],
                          subtitle: recent[index][2],
                        ),
                      );
                    },
                  ),
                  sectionHeader(local.from_other_fm, paths[1],
                      local.home_page_news_page_open_all),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: recent.length,
                    itemBuilder: (context, index) {
                      return RecentCard(
                        imageUrl: recent[index][0],
                        title: recent[index][1],
                        subtitle: recent[index][2],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding sectionHeader(String title, String pathToPlay, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PodcastDetailPage(
                    audioPlayer: audioPlayer,
                    path: pathToPlay,
                  ),
                ),
              );
            },
            child: Text(
              text,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
