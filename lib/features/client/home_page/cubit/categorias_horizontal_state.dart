part of 'categorias_horizontal_cubit.dart';

sealed class CategoriasHorizontalState extends Equatable {
  const CategoriasHorizontalState();

  @override
  List<Object> get props => [];
}

final class CategoriasHorizontalInitial
    extends CategoriasHorizontalState {}

final class CategoriasHorizontalLoading
    extends CategoriasHorizontalState {}

final class CategoriasHorizontalEmpty
    extends CategoriasHorizontalState {}

final class CategoriasHorizontalSuccess
    extends CategoriasHorizontalState {
  const CategoriasHorizontalSuccess({
    required this.categorias,
  });
  final List<CategoriaModel> categorias;

  @override
  List<Object> get props => [categorias];
}

final class CategoriasHorizontalError
    extends CategoriasHorizontalState {
  const CategoriasHorizontalError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
