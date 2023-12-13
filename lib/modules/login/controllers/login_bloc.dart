import 'package:bloc/bloc.dart';

import '../x_logins.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<GetLogin>(_handleLogin);
  }

  Future<void> _handleLogin(event, emit) async {
    String value = validateLogin(event);
    if (value != '') {
      emit(LoginValidation(value));
    } else {
      emit(LoginLoading());
      Map<String, String> loginData = {
        'email': event.email,
        'password': event.password,
      };
      final result = await LoginService.login(loginData);
      result.fold(
          (L) => emit(LoginError(L)), (R) => emit(LoginSuccess(result: R)));
    }
  }
}

//--validation for text field
String validateLogin(GetLogin data) {
  if (data.email?.isEmpty == true) {
    return 'Please Enter Your Email ID';
  }
  if (data.password?.isEmpty == true) {
    return 'Please Enter Your Password';
  }
  return '';
}
