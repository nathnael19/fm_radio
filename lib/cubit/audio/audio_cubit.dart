import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioCubit() : super(AudioState.initial()) {
    _audioPlayer.positionStream.listen((pos) {
      emit(state.copyWith(position: pos));
    });
    _audioPlayer.bufferedPositionStream.listen((buf) {
      emit(state.copyWith(buffered: buf));
    });
    _audioPlayer.durationStream.listen((dur) {
      if (dur != null) {
        emit(state.copyWith(duration: dur));
      }
    });
    _audioPlayer.playerStateStream.listen((playerState) {
      emit(state.copyWith(isPlaying: playerState.playing));
    });
  }

  Future<void> load(String url) async {
    try {
      await _audioPlayer.setAsset(url);
      emit(state.copyWith(isStopped: false)); // ⬅ Reset stopped state
      _audioPlayer.play();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString(), isStopped: false));
    }
  }

  void play() {
    emit(state.copyWith(isStopped: false));
    _audioPlayer.play();
  }

  void pause() => _audioPlayer.pause();
  void stop() {
    emit(state.copyWith(isStopped: true));
    _audioPlayer.stop();
  }

  void seek(Duration pos) => _audioPlayer.seek(pos);

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
