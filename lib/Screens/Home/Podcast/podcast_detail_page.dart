import 'package:ethio_fm_radio/Screens/Download/components/list_of_downloads.dart';
import 'package:ethio_fm_radio/cubit/audio/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PodcastDetailPage extends StatelessWidget {
  final String audioUrl;
  final String title;
  final String imageUrl;

  const PodcastDetailPage({
    super.key,
    required this.audioUrl,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final imageProvider = imageUrl.startsWith("http")
        ? NetworkImage(imageUrl)
        : AssetImage(imageUrl) as ImageProvider;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffAA2424),
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<AudioCubit, AudioState>(
        builder: (context, state) {
          final isSameAudio = state.url == audioUrl;
          final position = isSameAudio ? state.position : Duration.zero;
          final duration = isSameAudio ? state.duration : Duration.zero;

          return Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffAA2424), Colors.black],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Container(
                  width: 266.w,
                  height: 266.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                duration.inSeconds > 0
                    ? Column(
                        children: [
                          SizedBox(
                            width: 350.w,
                            child: Slider(
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds
                                  .toDouble()
                                  .clamp(0, duration.inSeconds.toDouble()),
                              onChanged: (value) {
                                context.read<AudioCubit>().seek(
                                      Duration(seconds: value.toInt()),
                                    );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 325.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_formatTime(position),
                                    style:
                                        const TextStyle(color: Colors.white)),
                                Text(_formatTime(duration),
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                SizedBox(height: 20.h),
                _buildPlaybackControls(context, state),
                SizedBox(height: 12.h),
                _buildInteractionRow(),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
                  child: const Text(
                    "ክፍሎች",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (_, index) => ListOfDownloads(
                      onTap: () {},
                      icon: Icons.download_for_offline_outlined,
                      title: "የትም? (Yetim?)",
                      imageUrl: "assets/images/girl3.png",
                      length: "1hr 30 min",
                      other: "16+",
                      year: "2025",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaybackControls(BuildContext context, AudioState state) {
    final isPlaying = state.isPlaying;
    return SizedBox(
      width: 300.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.skip_previous_rounded,
                size: 30.r, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.replay_10, size: 30.r, color: Colors.white),
            onPressed: () {
              final newPosition = state.position - const Duration(seconds: 10);
              context.read<AudioCubit>().seek(newPosition);
            },
          ),
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause_circle : Icons.play_circle,
              size: 78.r,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AudioCubit>().togglePlayPause();
            },
          ),
          IconButton(
            icon: Icon(Icons.forward_10, size: 30.r, color: Colors.white),
            onPressed: () {
              final newPosition = state.position + const Duration(seconds: 10);
              context.read<AudioCubit>().seek(newPosition);
            },
          ),
          IconButton(
            icon:
                Icon(Icons.skip_next_rounded, size: 30.r, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionRow() {
    return SizedBox(
      width: 360.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: const [
              Text("400", style: TextStyle(color: Colors.white)),
              Icon(Icons.thumb_up, color: Colors.white),
            ],
          ),
          Row(
            children: const [
              Text("20", style: TextStyle(color: Colors.white)),
              Icon(Icons.message, color: Colors.white),
            ],
          ),
          Row(
            children: const [
              Text("4", style: TextStyle(color: Colors.white)),
              Icon(FontAwesomeIcons.share, color: Colors.white),
            ],
          ),
          const Icon(Icons.bookmark, color: Colors.white),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffEDE4E6),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              child: Text(
                "Tip Creator",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
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
