class ListeningHistory {
  final String stationId;
  final DateTime playedAt;

  ListeningHistory({
    required this.stationId,
    required this.playedAt,
  });

  factory ListeningHistory.fromJson(Map<String, dynamic> json) =>
      ListeningHistory(
        stationId: json["stationId"],
        playedAt: DateTime.parse(json["playedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "stationId": stationId,
        "playedAt": playedAt.toIso8601String(),
      };
}
