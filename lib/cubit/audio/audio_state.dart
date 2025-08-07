part of 'audio_cubit.dart';

class AudioState {
  final Duration position;
  final Duration buffered;
  final Duration duration;
  final bool isPlaying;
  final bool isStopped;
  final String? errorMessage;

  const AudioState({
    required this.position,
    required this.buffered,
    required this.duration,
    required this.isPlaying,
    required this.isStopped,
    this.errorMessage,
  });

  factory AudioState.initial() {
    return const AudioState(
      position: Duration.zero,
      buffered: Duration.zero,
      duration: Duration.zero,
      isPlaying: false,
      isStopped: true,
      errorMessage: null,
    );
  }

  AudioState copyWith({
    Duration? position,
    Duration? buffered,
    Duration? duration,
    bool? isPlaying,
    bool? isStopped,
    String? errorMessage,
  }) {
    return AudioState(
      position: position ?? this.position,
      buffered: buffered ?? this.buffered,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
      isStopped: isStopped ?? this.isStopped,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        position,
        buffered,
        duration,
        isPlaying,
        isStopped,
        errorMessage,
      ];
}
