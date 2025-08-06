import 'dart:convert';

import 'package:ethio_fm_radio/Screens/Home/Podcast/model/podcast_category_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'podcast_state.dart';

class PodcastCubit extends Cubit<PodcastState> {
  PodcastCubit() : super(PodcastInitial());

  Future<void> loadPodcast() async {
    try {
      emit(PodcastLoading());
      final jsonString =
          await rootBundle.loadString("assets/data/podcast_database.json");
      print(jsonString);
      if (jsonString.trim().isEmpty) {
        throw Exception("json is empty");
      }
      List<dynamic> jsonData = json.decode(jsonString);
      final category =
          jsonData.map((e) => PodcastCategoryModel.fromJson(e)).toList();
      emit(PodcastLoaded(category: category));
    } catch (e) {
      emit(PodcastFailed(msg: e.toString()));
    }
  }
}
