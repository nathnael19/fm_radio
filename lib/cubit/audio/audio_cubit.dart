// audio_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioState(isPlaying: false));

  void play(String title, String imageUrl) {
    emit(AudioState(isPlaying: true, title: title, imageUrl: imageUrl));
  }

  void togglePlayPause() {
    emit(state.copyWith(isPlaying: !state.isPlaying));
  }

  void stop() {
    emit(AudioState(isPlaying: false));
  }
}
