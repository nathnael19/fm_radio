import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioCubit() : super(AudioState.initial()) {
    // Listen to position changes
    _audioPlayer.positionStream.listen((position) {
      emit(state.copyWith(position: position));
    });

    // Listen to duration changes
    _audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        emit(state.copyWith(duration: duration));
      }
    });

    // Listen to playback state (playing/paused)
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing &&
          playerState.processingState == ProcessingState.ready;
      emit(state.copyWith(isPlaying: isPlaying));
    });

    // Catch audio playback errors
    _audioPlayer.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('Playback error: $e');
    });
  }

  Future<void> play({
    required String url,
    required String title,
    required String imageUrl,
  }) async {
    try {
      print('Setting URL: $url');

      await _audioPlayer.stop(); // Ensure stopping previous audio
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(url)));

      print('Playing...');
      await _audioPlayer.play();

      emit(state.copyWith(
        isPlaying: true,
        title: title,
        imageUrl: imageUrl,
        url: url,
        duration: _audioPlayer.duration ?? Duration.zero,
      ));
    } catch (e) {
      print('Error playing audio: $e');
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
