import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/dados/servicos/produto_firebase.dart';

part 'produto_por_categoria_horizontal_state.dart';

class ProdutoPorCategoriaHorizontalCubit
    extends Cubit<ProdutoPorCategoriaHorizontalState> {
  ProdutoPorCategoriaHorizontalCubit()
      : super(ProdutoPorCategoriaHorizontalInitial());

  Future<void> getProdutosPorCategoria({
    CategoriaModel? categoria,
    bool cache = true,
  }) async {
    final produtoFirebase = ProdutoFirebase.instance;

    emit(ProdutoPorCategoriaHorizontalLoading());

    await produtoFirebase
        .getProdutos(categoria: categoria, cache: cache)
        .then(
          (e) => emit(
            ProdutoPorCategoriaHorizontalSuccess(produtoPorCategoria: e),
          ),
        )
        .onError(
          (e, t) =>
              emit(ProdutoPorCategoriaHorizontalError(message: e.toString())),
        );
  }
}
