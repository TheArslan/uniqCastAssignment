part of 'login_cubit.dart';

// All the states of Login Screen
@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingState extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String? message;

  LoginFailed(this.message);
}
