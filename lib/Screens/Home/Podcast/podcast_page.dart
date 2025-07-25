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
                  sectionHeader(
                    context,
                    title: local.only_fm,
                    pathToPlay: paths[0],
                    imageAsset: 'assets/images/girl1.png',
                    buttonText: local.home_page_news_page_open_all,
                  ),
                  buildPodcastGrid(context, itemCount: 3, pathOffset: 0),
                  sectionHeader(
                    context,
                    title: local.from_other_fm,
                    pathToPlay: paths[1],
                    imageAsset: 'assets/images/girl2.png',
                    buttonText: local.home_page_news_page_open_all,
                  ),
                  buildPodcastGrid(context,
                      itemCount: recent.length, pathOffset: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionHeader(
    BuildContext context, {
    required String title,
    required String pathToPlay,
    required String imageAsset,
    required String buttonText,
  }) {
    final audioCubit = context.read<AudioCubit>();
    final isPlayingSameAudio = audioCubit.state.url == pathToPlay;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          GestureDetector(
            onTap: () {
              if (!isPlayingSameAudio) {
                audioCubit.play(
                  url: pathToPlay,
                  title: title,
                  imageUrl: imageAsset,
                );
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PodcastDetailPage(
                    audioUrl: pathToPlay,
                    title: title,
                    imageUrl: imageAsset,
                  ),
                ),
              );
            },
            child: Text(
              buttonText,
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

  Widget buildPodcastGrid(
    BuildContext context, {
    required int itemCount,
    required int pathOffset,
  }) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final title = recent[index][1];
        final imageUrl = recent[index][0];
        final path = paths[(index + pathOffset) % paths.length];

        final audioCubit = context.read<AudioCubit>();
        final isPlayingSameAudio = audioCubit.state.url == path;

        return GestureDetector(
          onTap: () {
            if (!isPlayingSameAudio) {
              audioCubit.play(
                url: path,
                title: title,
                imageUrl: imageUrl,
              );
            }

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PodcastDetailPage(
                  audioUrl: path,
                  title: title,
                  imageUrl: imageUrl,
                ),
              ),
            );
          },
          child: RecentCard(
            imageUrl: imageUrl,
            title: title,
            subtitle: recent[index][2],
          ),
        );
      },
    );
  }
}
