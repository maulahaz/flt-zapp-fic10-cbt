abstract class LoginEvent {}

class GetLogin extends LoginEvent {
  final String? email;
  final String? password;

  GetLogin({this.email, this.password});
}