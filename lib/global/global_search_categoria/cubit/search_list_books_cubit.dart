import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/dados/servicos/categoria_firebase.dart';

part 'search_list_books_state.dart';

class SearchListBooksCubit extends Cubit<SearchListCategoriasState> {
  SearchListBooksCubit() : super(SearchListCategoriasInitial());

  void loadBookList() {
    try {
      emit(SearchListCategoriasLoading());
      final categoriaUC = CategoriaFirebase();

      unawaited(
        categoriaUC.getCategorias().then((categorias) {
          if (categorias.isEmpty) {
            categorias.add(CategoriaModel.fake());
          }

          categorias.sort((a, b) => a.descricao.compareTo(b.descricao));
          emit(SearchListCategoriasLoaded(categorias));
        }).onError((error, stackTrace) {
          emit(
            SearchListCategoriasError(error.toString()),
          );
        }),
      );
    } catch (e) {
      const SearchListCategoriasError(
        'Ocorreu um erro ao listar as categorias',
      );
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      emit(SearchListCategoriasDeleteLoading());
      final categoriaUC = CategoriaFirebase();

      await categoriaUC.deleteCategoria(id);

      loadBookList();
    } catch (e) {
      emit(const SearchListCategoriasError('Erro ao deletar o livro'));
    }
  }
}
