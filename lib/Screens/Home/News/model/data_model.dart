import 'package:ethio_fm_radio/Screens/Home/News/model/meta_model.dart';

class DataModel {
  final String channel;
  final String imageUrl;
  final String date;
  final String title;
  final String description;
  final MetaData meta;

  DataModel({
    required this.channel,
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.description,
    required this.meta,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        channel: json['channel'],
        imageUrl: json['imageUrl'],
        date: json['date'],
        title: json['title'],
        description: json['description'],
        meta: MetaData.fromJson(json['meta']),
      );
}
