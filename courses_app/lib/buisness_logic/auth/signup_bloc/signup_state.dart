// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final String username;
  final String email;
  final String phone;
  final String password;
  const SignupState({
    this.username = "",
    this.email = "",
    this.phone = "",
    this.password = "",
  });

  SignupState copyWith({
    String? username,
    String? email,
    String? phone,
    String? password,
  }) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory SignupState.fromMap(Map<String, dynamic> map) {
    return SignupState(
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  @override
  String toString() {
    return 'SignupState(username: $username, email: $email, phone: $phone, password: $password)';
  }

  @override
  List<Object?> get props => [username, email, password, phone];
}
