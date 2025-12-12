part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel userData;
  LoginSuccess({required this.userData});
}

class LoginFailure extends LoginState {
  final ApiErrorModel error;
  LoginFailure({required this.error});
}
