part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class VerifyCurrentUser extends AuthenticationEvent {
  const VerifyCurrentUser();
}

class SignUpEvent extends AuthenticationEvent {
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.nome,
    required this.role,
  });

  final String email;
  final String password;
  final String nome;
  final String role;

  @override
  List<Object> get props => [email, password, nome, role];
}

class SignInEvent extends AuthenticationEvent {
  const SignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}
