import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/cubit/audio/audio_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverlayPlay extends StatelessWidget {
  const OverlayPlay({super.key});

  @override
  Widget build(BuildContext context) {
    final audioCubit = BlocProvider.of<AudioCubit>(context);

    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        if (state.isStopped == true) {
          return const SizedBox.shrink();
        }

        return Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: 1.0,
            child: Container(
              margin: EdgeInsets.all(getMobileFontSize(context, 8)),
              padding: EdgeInsets.symmetric(
                  horizontal: getMobileWidth(context, 16),
                  vertical: getMobileHeight(context, 7)),
              decoration: BoxDecoration(
                color: Color(0xff1A0101),
                borderRadius:
                    BorderRadius.circular(getMobileFontSize(context, 14)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.music_note, color: Colors.white70),
                  SizedBox(width: getMobileWidth(context, 12)),
                  Expanded(
                    child: Text(
                      state.isPlaying.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getMobileFontSize(context, 14)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      state.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: getMobileFontSize(context, 24),
                    ),
                    onPressed: () {
                      state.isPlaying ? audioCubit.pause() : audioCubit.play();
                    },
                  ),
                  state.isPlaying == false
                      ? IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            audioCubit.stop();
                          },
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
