import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_item_perdido_state.dart';

class DataItemPerdidoCubit extends Cubit<DataItemPerdidoState> {
  DataItemPerdidoCubit() : super(DataItemPerdidoInitial());

  void changeDate(DateTime date) {
    emit(DataItemPerdidoDateChanged(date));
  }

}
