import 'package:ethio_fm_radio/Screens/Home/News/model/comment_model.dart';

class MetaData {
  final int views;
  final int likes;
  final int shares;
  final List<Comment> comments;

  MetaData({
    required this.views,
    required this.likes,
    required this.shares,
    required this.comments,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        views: json['views'],
        likes: json['likes'],
        shares: json['shares'],
        comments:
            (json['comments'] as List).map((e) => Comment.fromJson(e)).toList(),
      );
}
