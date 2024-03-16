// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  String email;
  String password;
  AuthLoginRequested({
    required this.email,
    required this.password,
  });
}

class AuthLogoutRequested extends AuthEvent {}
