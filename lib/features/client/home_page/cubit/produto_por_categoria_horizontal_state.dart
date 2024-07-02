part of 'produto_por_categoria_horizontal_cubit.dart';

sealed class ProdutoPorCategoriaHorizontalState extends Equatable {
  const ProdutoPorCategoriaHorizontalState();

  @override
  List<Object> get props => [];
}

final class ProdutoPorCategoriaHorizontalInitial
    extends ProdutoPorCategoriaHorizontalState {}

final class ProdutoPorCategoriaHorizontalLoading
    extends ProdutoPorCategoriaHorizontalState {}

final class ProdutoPorCategoriaHorizontalEmpty
    extends ProdutoPorCategoriaHorizontalState {}

final class ProdutoPorCategoriaHorizontalSuccess
    extends ProdutoPorCategoriaHorizontalState {
  const ProdutoPorCategoriaHorizontalSuccess({
    required this.produtoPorCategoria,
  });
  final List<ProdutoModel> produtoPorCategoria;

  @override
  List<Object> get props => [produtoPorCategoria];
}

final class ProdutoPorCategoriaHorizontalError
    extends ProdutoPorCategoriaHorizontalState {
  const ProdutoPorCategoriaHorizontalError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
