part of 'signin_bloc.dart';

abstract class SigninEvent {
  const SigninEvent();
}

class EmailEvent extends SigninEvent {
  final String email;
  EmailEvent({required this.email});
}

class PasswordEvent extends SigninEvent {
  final String password;
  PasswordEvent({required this.password});
}

class SigninHandleEvent extends SigninEvent {
  final BuildContext context;
  SigninHandleEvent({required this.context});
}

class GoToSignupEvent extends SigninEvent {
  BuildContext context;
  GoToSignupEvent({required this.context});
}
