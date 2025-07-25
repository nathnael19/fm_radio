import 'package:ethio_fm_radio/cubit/audio/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastDetailPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String audioUrl;

  const PodcastDetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.audioUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocBuilder<AudioCubit, AudioState>(
        builder: (context, state) {
          final isPlaying = state.url == audioUrl && state.isPlaying;
          final isLoaded = state.url == audioUrl;

          return Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    height: 220.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                IconButton(
                  iconSize: 64.sp,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    if (isLoaded) {
                      context.read<AudioCubit>().togglePlayPause();
                    } else {
                      context.read<AudioCubit>().play(
                            url: audioUrl,
                            title: title,
                            imageUrl: imageUrl,
                          );
                    }
                  },
                ),
                if (isLoaded) ...[
                  Slider(
                    value: state.position.inSeconds.toDouble(),
                    min: 0,
                    max: state.duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      context
                          .read<AudioCubit>()
                          .seek(Duration(seconds: value.toInt()));
                    },
                  ),
                  Text(
                    "${_formatTime(state.position)} / ${_formatTime(state.duration)}",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
