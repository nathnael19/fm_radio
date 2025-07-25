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
        if (!state.isPlaying || state.title == null) {
          return const SizedBox.shrink(); // No UI if not playing
        }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: const Color(0xff1A0101),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(state.imageUrl!),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  state.title!,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(
                  state.isPlaying
                      ? FontAwesomeIcons.pause
                      : FontAwesomeIcons.play,
                  color: Colors.white,
                  size: 18.sp,
                ),
                onPressed: () {
                  context.read<AudioCubit>().togglePlayPause();
                },
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  context.read<AudioCubit>().stop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
