import 'package:ethio_fm_radio/Databases/live_database.dart';
import 'package:ethio_fm_radio/Screens/Home/Podcast/podcast_detail_page.dart';
import 'package:ethio_fm_radio/Screens/Home/components/recent_card.dart';
import 'package:ethio_fm_radio/cubit/audio/audio_cubit.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PodcastPage extends StatelessWidget {
  PodcastPage({super.key});

  final List recent = recentPrograms;
  final List<String> paths = [
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
  ];

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
                  sectionHeader(context, local.only_fm, paths[0],
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
                          final title = recent[index][1];
                          final imageUrl = recent[index][0];
                          // Play audio in cubit
                          context.read<AudioCubit>().play(
                                url: paths[index],
                                title: title,
                                imageUrl: imageUrl,
                              );
                          // Navigate and pass info
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PodcastDetailPage(
                                path: paths[index],
                                title: title,
                                imageUrl: imageUrl,
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
                  sectionHeader(context, local.from_other_fm, paths[1],
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

  Padding sectionHeader(
      BuildContext context, String title, String pathToPlay, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          GestureDetector(
            onTap: () {
              // For this "open all", just play the path and navigate without title/image
              context.read<AudioCubit>().play(
                    url: pathToPlay,
                    title: title,
                    imageUrl: 'assets/images/default.png', // fallback image
                  );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PodcastDetailPage(
                    path: pathToPlay,
                    title: title,
                    imageUrl: 'assets/images/default.png',
                  ),
                ),
              );
            },
            child: Text(
              text,
              style: const TextStyle(
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
