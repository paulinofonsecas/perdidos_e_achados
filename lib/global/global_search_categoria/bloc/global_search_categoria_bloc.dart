import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/servicos/produto_firebase.dart';

part 'global_search_categoria_event.dart';
part 'global_search_categoria_state.dart';

class GlobalSearchCategoriaBloc
    extends Bloc<GlobalSearchCategoriaEvent, GlobalSearchCategoriaState> {
  GlobalSearchCategoriaBloc() : super(const GlobalSearchCategoriaInitial()) {
    on<CustomGlobalSearchCategoriaEvent>(_onCustomGlobalSearchCategoriaEvent);
  }

  FutureOr<void> _onCustomGlobalSearchCategoriaEvent(
    CustomGlobalSearchCategoriaEvent event,
    Emitter<GlobalSearchCategoriaState> emit,
  ) async {
    emit(const GlobalSearchCategoriaLoading());

    await ItemFirebase.instance.getItems().then((value) {
      if (value.isEmpty) {
        emit(GlobalSearchCategoriaEmpty());
        return;
      }

      emit(GlobalSearchCategoriaSuccess(value));
    }).onError((error, stackTrace) {
      print(error);
      emit(const GlobalSearchCategoriaError('Erro ao carregar os livros'));
    });
  }
}
