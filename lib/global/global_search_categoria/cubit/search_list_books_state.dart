part of 'search_list_books_cubit.dart';

sealed class SearchListCategoriasState extends Equatable {
  const SearchListCategoriasState();

  @override
  List<Object> get props => [];
}

final class SearchListCategoriasInitial extends SearchListCategoriasState {}

class SearchListCategoriasLoading extends SearchListCategoriasState {}

final class SearchListCategoriasDeleteLoading
    extends SearchListCategoriasState {}

final class SearchListCategoriasLoaded extends SearchListCategoriasState {
  const SearchListCategoriasLoaded(this.books);

  final List<CategoriaModel> books;

  @override
  List<Object> get props => [books];
}

final class SearchListCategoriasError extends SearchListCategoriasState {
  const SearchListCategoriasError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
