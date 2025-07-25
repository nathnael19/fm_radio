part of 'audio_cubit.dart';

class AudioState {
  final bool isPlaying;
  final String? title;
  final String? imageUrl;
  final String? url;
  final Duration position;
  final Duration duration;
  final bool isLoading;
  final String? error;

  const AudioState({
    required this.isPlaying,
    required this.position,
    required this.duration,
    required this.isLoading,
    this.title,
    this.imageUrl,
    this.url,
    this.error,
  });

  factory AudioState.initial() => const AudioState(
        isPlaying: false,
        position: Duration.zero,
        duration: Duration.zero,
        isLoading: false,
        title: null,
        imageUrl: null,
        url: null,
        error: null,
      );

  AudioState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    bool? isLoading,
    String? title,
    String? imageUrl,
    String? url,
    String? error,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isLoading: isLoading ?? this.isLoading,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      url: url ?? this.url,
      error: error,
    );
  }
}
