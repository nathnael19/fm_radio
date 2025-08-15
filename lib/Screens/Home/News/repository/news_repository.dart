import 'dart:convert';

import 'package:ethio_fm_radio/Screens/Home/News/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<NewsModel>> getPosts() async {
    final String binId = '68972f33ae596e708fc5d8c0';
    final String secretKey =
        "\$2a\$10\$OdrPUzOSvGmobZmaalIaC.xV3OJsf4kym57057x7siedund/ZQTMC";

    try {
      final url = Uri.parse('https://api.jsonbin.io/v3/b/$binId/latest');
      final response = await http.get(url, headers: {
        'X-Master-Key': secretKey,
      });

      if (response.statusCode != 200) {
        throw Exception('Failed to load JSON: ${response.statusCode}');
      }

      final jsonString = response.body;
      final jsonData = jsonDecode(jsonString);
      final List<dynamic> dataList = jsonData['record'];

      final category = dataList.map((e) => NewsModel.fromJson(e)).toList();

      return category;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
