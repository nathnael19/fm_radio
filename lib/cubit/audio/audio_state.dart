part of 'audio_cubit.dart';

class AudioState {
  final bool isPlaying;
  final String? title;
  final String? imageUrl;

  AudioState({required this.isPlaying, this.title, this.imageUrl});

  AudioState copyWith({
    bool? isPlaying,
    String? title,
    String? imageUrl,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
