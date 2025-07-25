part of 'audio_cubit.dart';

class AudioState {
  final bool isPlaying;
  final String? title;
  final String? imageUrl;
  final String? url;
  final Duration position;
  final Duration duration;

  const AudioState({
    required this.isPlaying,
    this.title,
    this.imageUrl,
    this.url,
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  factory AudioState.initial() => const AudioState(isPlaying: false);

  AudioState copyWith({
    bool? isPlaying,
    String? title,
    String? imageUrl,
    String? url,
    Duration? position,
    Duration? duration,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      url: url ?? this.url,
      position: position ?? this.position,
      duration: duration ?? this.duration,
    );
  }
}
