part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final RegisterEntity model;

  LoginSuccess(this.model);
}

class LoginFailure extends LoginState {
  final FailureError failure;

  LoginFailure(this.failure);
}
