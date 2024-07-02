import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_field_state.dart';

class PasswordFieldCubit extends Cubit<PasswordFieldState> {
  PasswordFieldCubit() : super(const PasswordFieldInitial());

  void updatePassword(String password) {
    emit(PasswordFieldValid(password));
  }
}
