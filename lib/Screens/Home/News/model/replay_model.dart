class ReplayModel {
  final String? username;
  final String? comment;
  final String? timestamp;
  final int? likes;

  ReplayModel({
    required this.username,
    required this.comment,
    required this.timestamp,
    required this.likes,
  });

  factory ReplayModel.fromJson(Map<String, dynamic> json) => ReplayModel(
        username: json['username'],
        comment: json['comment'],
        timestamp: json['timestamp'],
        likes: json['likes'],
      );
}
