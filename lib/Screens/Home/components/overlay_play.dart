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
        if (state.title == null || state.imageUrl == null) {
          return SizedBox.shrink(); // Hide if nothing playing
        }
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: const Color(0xff1A0101),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage: AssetImage(state.imageUrl!),
                  ),
                  SizedBox(width: 10.r),
                  Text(
                    state.title!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/soundwave.png", width: 100.w),
                  IconButton(
                    onPressed: () {
                      context.read<AudioCubit>().stop();
                    },
                    icon: const Icon(Icons.clear, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<AudioCubit>().togglePlayPause();
                    },
                    icon: Icon(
                      state.isPlaying
                          ? FontAwesomeIcons.pause
                          : FontAwesomeIcons.play,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
