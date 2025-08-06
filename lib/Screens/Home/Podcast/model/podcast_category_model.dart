import 'package:ethio_fm_radio/Screens/Home/Podcast/model/podcast_model.dart';

class PodcastCategoryModel {
  final String category;
  final List<PodcastModel> podcasts;

  PodcastCategoryModel({
    required this.category,
    required this.podcasts,
  });

  factory PodcastCategoryModel.fromJson(Map<String, dynamic> json) =>
      PodcastCategoryModel(
        category: json['category'],
        podcasts: (json['data'] as List)
            .map((e) => PodcastModel.fromJson(e))
            .toList(),
      );
}
