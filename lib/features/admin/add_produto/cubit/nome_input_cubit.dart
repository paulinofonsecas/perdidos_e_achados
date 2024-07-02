import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nome_input_state.dart';

class NomeInputCubit extends Cubit<NomeInputState> {
  NomeInputCubit() : super(NomeInputInitial());

  void onChanged(String t) {
    emit(NomeInputChanged(nome: t));
  }
}
