part of 'password_field_cubit.dart';

sealed class PasswordFieldState extends Equatable {
  const PasswordFieldState({required this.password});
  final String password;

  @override
  List<Object> get props => [password];
}

final class PasswordFieldInitial extends PasswordFieldState {
  const PasswordFieldInitial({
    super.password = '',
  });
}

final class PasswordFieldValid extends PasswordFieldState {
  const PasswordFieldValid(String password) : super(password: password);
}
