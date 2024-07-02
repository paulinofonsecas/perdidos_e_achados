import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nome_field_state.dart';

class NomeFieldCubit extends Cubit<NomeFieldState> {
  NomeFieldCubit() : super(const NomeFieldInitial());

  void updateNome(String nome) {
    emit(NomeFieldValid(nome));
  }
}
