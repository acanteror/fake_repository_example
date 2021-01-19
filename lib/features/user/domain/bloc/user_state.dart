part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  final List<User> users;
  const UserInitial({this.users = const []}) : super();
}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final List<User> users;
  const UserSuccess({this.users}) : super();

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {}
