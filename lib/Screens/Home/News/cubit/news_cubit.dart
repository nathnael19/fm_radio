import 'dart:convert';

import 'package:ethio_fm_radio/Screens/Home/News/model/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  // Replace with your actual Bin ID and secret key from jsonbin.io or your JSON URL
  final String binId = '6895b409203a8b52b5e19ae3';
  final String secretKey =
      "\$2a\$10\$OdrPUzOSvGmobZmaalIaC.xV3OJsf4kym57057x7siedund/ZQTMC";

  Future<void> loadNews() async {
    emit(NewsLoading());
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
      // jsonbin.io wraps your data inside 'record'
      final List<dynamic> dataList = jsonData['record'];

      final category = dataList.map((e) => NewsModel.fromJson(e)).toList();

      emit(NewsLoaded(category: category));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}
