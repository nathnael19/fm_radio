class ReplayModel {
  final String? username;
  final String? comment;
  final String? timestamp;

  ReplayModel({
    required this.username,
    required this.comment,
    required this.timestamp,
  });

  factory ReplayModel.fromJson(Map<String, dynamic> json) => ReplayModel(
    username: json['username'],
    comment: json['comment'],
    timestamp: json['timestamp'],
  );
}
