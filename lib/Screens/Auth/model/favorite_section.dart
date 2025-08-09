class FavoriteStation {
  final String stationId;
  final String stationName;
  final String frequency;

  FavoriteStation({
    required this.stationId,
    required this.stationName,
    required this.frequency,
  });

  factory FavoriteStation.fromJson(Map<String, dynamic> json) =>
      FavoriteStation(
        stationId: json["stationId"],
        stationName: json["stationName"],
        frequency: json["frequency"],
      );

  Map<String, dynamic> toJson() => {
        "stationId": stationId,
        "stationName": stationName,
        "frequency": frequency,
      };
}
