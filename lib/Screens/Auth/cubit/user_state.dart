part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final List<UserElement> users;

  const UserLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

final class UserFailed extends UserState {
  final String msg;

  const UserFailed({required this.msg});

  @override
  List<Object> get props => [msg];
}
