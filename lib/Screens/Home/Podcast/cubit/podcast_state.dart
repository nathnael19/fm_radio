part of 'podcast_cubit.dart';

abstract class PodcastState {}

final class PodcastInitial extends PodcastState {}

final class PodcastLoading extends PodcastState {}

final class PodcastLoaded extends PodcastState {
  final List<PodcastCategoryModel> category;

  PodcastLoaded({required this.category});
}

final class PodcastFailed extends PodcastState {
  final String msg;

  PodcastFailed({required this.msg});
}
