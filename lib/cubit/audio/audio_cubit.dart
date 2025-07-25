import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioCubit() : super(AudioState.initial()) {
    _listenToStreams();
  }

  void _listenToStreams() {
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
    // If this audio is already playing, skip re-initialization
    if (state.url == url) {
      togglePlayPause(); // optional: toggle instead of restarting
      return;
    }

    try {
      emit(state.copyWith(isLoading: true, error: null));

      await _audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(url),
          tag: MediaItem(
            id: url,
            title: title,
            album: "Podcast",
            artUri: Uri.tryParse(imageUrl),
          ),
        ),
      );

      await _audioPlayer.play();

      emit(state.copyWith(
        isPlaying: true,
        title: title,
        imageUrl: imageUrl,
        url: url,
        duration: _audioPlayer.duration ?? Duration.zero,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(error: 'Playback error: $e', isLoading: false));
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

  // Getter for current position to sync with other pages
  Duration get currentPosition => _audioPlayer.position;

  Duration get totalDuration => _audioPlayer.duration ?? Duration.zero;

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
