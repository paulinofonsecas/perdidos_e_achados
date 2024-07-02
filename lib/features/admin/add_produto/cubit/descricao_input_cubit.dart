import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'descricao_input_state.dart';

class DescricaoInputCubit extends Cubit<DescricaoInputState> {
  DescricaoInputCubit() : super(DescricaoInputInitial());

  void onChanged(String t) {
    emit(DescricaoInputChanged(descricao: t));
  }
}
