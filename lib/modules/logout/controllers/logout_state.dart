abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {}

class LogoutError extends LogoutState {
  final String? error;
  LogoutError(this.error);
}
