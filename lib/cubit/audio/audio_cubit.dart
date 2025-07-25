import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioCubit() : super(AudioState.initial()) {
    _audioPlayer.positionStream.listen((position) {
      emit(state.copyWith(position: position));
    });

    _audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        emit(state.copyWith(duration: duration));
      }
    });

    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing &&
          playerState.processingState == ProcessingState.ready;
      emit(state.copyWith(isPlaying: isPlaying));
    });
  }

  Future<void> play({
    required String url,
    required String title,
    required String imageUrl,
  }) async {
    try {
      print('Setting URL: $url');
      await _audioPlayer.setUrl(url);
      print('Playing audio...');
      await _audioPlayer.play();
      print('Playback started');
      emit(state.copyWith(
        isPlaying: true,
        title: title,
        imageUrl: imageUrl,
        url: url,
      ));
    } catch (e) {
      print('Error playing audio on Windows: $e');
    }
  }

  void togglePlayPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
      emit(state.copyWith(isPlaying: false));
    } else {
      _audioPlayer.play();
      emit(state.copyWith(isPlaying: true));
    }
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
    emit(state.copyWith(position: position));
  }

  void stop() {
    _audioPlayer.stop();
    emit(AudioState.initial());
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
