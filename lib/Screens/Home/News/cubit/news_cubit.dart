import 'dart:convert';

import 'package:ethio_fm_radio/Screens/Home/News/model/news_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> loadNews() async {
    emit(NewsLoading());
    try {
      final jsonString =
          await rootBundle.loadString("assets/data/news_database.json");
      print(jsonString);
      if (jsonString.trim().isEmpty) {
        throw Exception("Json is Empty!!");
      }

      List<dynamic> jsonData = json.decode(jsonString);
      final category = jsonData.map((e) => NewsModel.fromJson(e)).toList();
      emit(NewsLoaded(category: category));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}
