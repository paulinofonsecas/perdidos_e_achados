import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/dados/servicos/produto_firebase.dart';

part 'gestao_produtos_event.dart';
part 'gestao_produtos_state.dart';

class GestaoProdutosBloc
    extends Bloc<GestaoProdutosEvent, GestaoProdutosState> {
  GestaoProdutosBloc() : super(const GestaoProdutosInitial()) {
    on<GetAllProdutosEvent>(_onGetAllProdutosEvent);
  }

  FutureOr<void> _onGetAllProdutosEvent(
    GetAllProdutosEvent event,
    Emitter<GestaoProdutosState> emit,
  ) async {
    emit(const GetAllProdutosLoading());

    await ProdutoFirebase.instance
        .getProdutos(cache: event.inCache)
        .then((value) {
      if (value.isEmpty) {
        emit(GetAllProdutosEmpty());
        return;
      }

      emit(GetAllProdutosSuccess(value));
    }).onError((error, stackTrace) {
      print(error);
      emit(const GetAllProdutosError('Erro ao carregar os livros'));
    });
  }
}
