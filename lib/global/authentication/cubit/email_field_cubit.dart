import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_field_state.dart';

class EmailFieldCubit extends Cubit<EmailFieldState> {
  EmailFieldCubit() : super(const EmailFieldInitial());

  void updateEmail(String email) {
    emit(EmailFieldValid(email));
  }
}
