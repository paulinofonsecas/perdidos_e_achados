// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'disponibilidade_field_state.dart';

class DisponibilidadeFieldCubit extends Cubit<DisponibilidadeFieldState> {
  DisponibilidadeFieldCubit() : super(const DisponibilidadeFieldInitial());

  void onChanged(bool value) {
    if (value != state.disponibilidade) {
      emit(DisponibilidadeFieldChanged(disponibilidade: value));
    }
  }
}
