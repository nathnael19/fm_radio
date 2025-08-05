import 'package:ethio_fm_radio/Screens/Home/News/model/data_model.dart';

class NewsModel {
  final String category;
  final List<DataModel> data;

  NewsModel({required this.category, required this.data});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        category: json['category'],
        data: (json['data'] as List).map((e) => DataModel.fromJson(e)).toList(),
      );
}
