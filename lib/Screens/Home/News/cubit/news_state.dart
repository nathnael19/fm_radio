part of 'news_cubit.dart';

abstract class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<NewsModel> category;

  NewsLoaded({required this.category});
}

final class NewsError extends NewsState {
  final String message;

  NewsError({required this.message});
}
