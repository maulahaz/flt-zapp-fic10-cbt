import 'package:bloc/bloc.dart';

import '../x_logouts.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<GetLogout>(_handleLogout);
  }

  Future<void> _handleLogout(event, emit) async {
    emit(LogoutLoading());
    print('==>Goto Service');
    final result = await LogoutService.logout();
    print('==>Result :'+result.toString());
    result.fold((L) => emit(LogoutError(L)), (R) => emit(LogoutSuccess()));
  }
}
