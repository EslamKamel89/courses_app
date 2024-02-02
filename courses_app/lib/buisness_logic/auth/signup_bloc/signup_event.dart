// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'signup_bloc.dart';

class SignupEvent {
  final String username;
  final String email;
  final String phone;
  final String password;
  final BuildContext context;
  const SignupEvent({
    required this.context,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  String toString() {
    return 'SignupEvent(username: $username, email: $email, phone: $phone, password: $password)';
  }
}
