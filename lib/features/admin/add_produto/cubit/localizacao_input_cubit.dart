import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'localizacao_input_state.dart';

class LocalizacaoInputCubit extends Cubit<LocalizacaoInputState> {
  LocalizacaoInputCubit() : super(LocalizacaoInputInitial());

  void onChanged(String t) {
    emit(LocalizacaoInputChanged(l: t));
  }
}
