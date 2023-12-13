import 'package:bloc/bloc.dart';

import '../x_logouts.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) {});
    on<GetLogout>(_handleLogout);
  }

  Future<void> _handleLogout(event, emit) async {
    emit(LogoutLoading());
    Map<String, String> logoutData = {
      'email': event.email,
      'password': event.password,
    };
    final result = await LogoutService.logout(logoutData);
    result.fold((L) => emit(LogoutError(L)), (R) => emit(LogoutSuccess()));
  }
}
