abstract class SignupEvent {}

//GetSignup Event for Creating New User
class GetSignup extends SignupEvent {
  final String? fullname;
  final String? email;
  final String? phoneNumber;
  final String? password;

  GetSignup({this.fullname, this.email, this.phoneNumber, this.password});
}