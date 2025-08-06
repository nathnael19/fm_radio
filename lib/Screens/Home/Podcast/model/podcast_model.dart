class PodcastModel {
  final String title;
  final String imageUrl;
  final String audioUrl;

  PodcastModel({
    required this.title,
    required this.imageUrl,
    required this.audioUrl,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
        title: json['title'],
        imageUrl: json['imageUrl'],
        audioUrl: json['audioUrl'],
      );
}
