import '../../register/x_registers.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidation extends LoginState {
  final String? value;
  LoginValidation(this.value);
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthorizationModel result;
  LoginSuccess({required this.result});
}

class LoginError extends LoginState {
  final String? error;
  LoginError(this.error);
}
