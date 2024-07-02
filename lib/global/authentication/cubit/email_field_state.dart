part of 'email_field_cubit.dart';

sealed class EmailFieldState extends Equatable {
  const EmailFieldState({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

final class EmailFieldInitial extends EmailFieldState {
  const EmailFieldInitial() : super(email: '');
}

final class EmailFieldValid extends EmailFieldState {
  const EmailFieldValid(String email) : super(email: email);
}
