part of 'signin_bloc.dart';

class SigninState extends Equatable {
  final String email;
  final String password;
  const SigninState({this.email = "", this.password = ""});

  SigninState copyWith({
    String? email,
    String? password,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory SigninState.fromMap(Map<String, dynamic> map) {
    return SigninState(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SigninState.fromJson(String source) {
    return SigninState.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() {
    return 'SigninState(email: $email, password: $password)';
  }
}
