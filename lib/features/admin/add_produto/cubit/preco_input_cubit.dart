import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'preco_input_state.dart';

class PrecoInputCubit extends Cubit<PrecoInputState> {
  PrecoInputCubit() : super(PrecoInputInitial());

  void onChanged(String t) {
    final value = double.tryParse(t);

    if (value != null) {
      emit(PrecoInputChanged(preco: value));
    } else {
      emit(const PrecoInputError('Indique um preço valido!'));
    }
  }
}
