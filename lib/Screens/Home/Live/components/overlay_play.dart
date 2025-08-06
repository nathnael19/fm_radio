import 'package:ethio_fm_radio/Screens/Home/Podcast/podcast_detail_page.dart';
import 'package:ethio_fm_radio/cubit/audio/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverlayPlay extends StatelessWidget {
  const OverlayPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        if (state.title == null) return const SizedBox.shrink();

        final imageWidget =
            state.imageUrl != null && state.imageUrl!.startsWith("http")
                ? NetworkImage(state.imageUrl!)
                : AssetImage(state.imageUrl ?? "") as ImageProvider;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PodcastDetailPage(
                  audioUrl: state.url!,
                  title: state.title!,
                  imageUrl: state.imageUrl!,
                ),
              ),
            );
          },
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: state.isPlaying ? 1 : 0.9,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xff1A0101),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage: imageWidget,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      state.title ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      state.isPlaying
                          ? FontAwesomeIcons.pause
                          : FontAwesomeIcons.play,
                      color: Colors.white70,
                      size: 20.sp,
                    ),
                    onPressed: () =>
                        context.read<AudioCubit>().togglePlayPause(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white70),
                    onPressed: () => context.read<AudioCubit>().stop(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
