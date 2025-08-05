import 'package:ethio_fm_radio/Screens/Home/News/model/replay_model.dart';

class Comment {
  final String username;
  final String comment;
  final String timestamp;
  final List<ReplayModel> replies;

  Comment({
    required this.username,
    required this.comment,
    required this.timestamp,
    required this.replies,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comment: json['comment'],
        replies: (json['replies'] as List)
            .map((e) => ReplayModel.fromJson(e))
            .toList(),
        timestamp: json['timestamp'],
        username: json['username'],
      );
}
