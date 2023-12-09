import '../x_registers.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupValidation extends SignupState {
  final String? value;
  SignupValidation(this.value);
}

class SignupLoading extends SignupState {}

 class SignupLoaded extends SignupState {
  final AuthorizationModel result;
  SignupLoaded({required this.result});
}

class SignupError extends SignupState {
  final String? error;
  SignupError(this.error);
}