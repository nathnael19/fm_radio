import 'package:ethio_fm_radio/Screens/Home/News/model/news_model.dart';
import 'package:ethio_fm_radio/Screens/Home/News/repository/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> loadNews() async {
    emit(NewsLoading());
    try {
      final category = await NewsRepository().getPosts();
      emit(NewsLoaded(category: category));
    } catch (e) {
      emit(NewsError(message: e.toString()));
    }
  }
}
