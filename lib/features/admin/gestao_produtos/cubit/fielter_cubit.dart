import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/models/ordenacao.dart';

part 'fielter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterInitial(ordenacao: Ordenacao.alfabetica));

  void changeFilter(Ordenacao ordenacao) {
    emit(FilterChanged(ordenacao: ordenacao));
  }
}
