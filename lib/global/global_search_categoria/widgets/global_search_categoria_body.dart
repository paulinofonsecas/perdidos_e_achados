import 'package:flutter/material.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/global/global_search_categoria/bloc/bloc.dart';
import 'package:gestao_restaurante/global/global_search_categoria/cubit/search_list_books_cubit.dart';
import 'package:searchable_listview/searchable_listview.dart';

/// {@template global_search_categoria_body}
/// Body of the GlobalSearchCategoriaPage.
///
/// Add what it does
/// {@endtemplate}
class GlobalSearchCategoriaBody extends StatelessWidget {
  /// {@macro global_search_categoria_body}
  const GlobalSearchCategoriaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: BlocBuilder<SearchListBooksCubit, SearchListCategoriasState>(
        bloc: context.read<SearchListBooksCubit>()..loadBookList(),
        builder: (context, state) {
          if (state is SearchListCategoriasLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SearchListCategoriasError) {
            return const Center(
              child: Text('Ups, algo deu errado'),
            );
          }

          if (state is SearchListCategoriasLoaded) {
            return SearchableList<CategoriaModel>(
              initialList: state.books,
              itemBuilder: (CategoriaModel categoria) =>
                  Text(categoria.descricao),
              filter: (String value) => state.books
                  .where(
                    (element) => element.descricao
                        .toLowerCase()
                        .contains(value.toLowerCase()),
                  )
                  .toList(),
              emptyWidget: const Placeholder(),
              inputDecoration: const InputDecoration(
                hintText: 'Pesquisar livros',
                fillColor: Colors.white,
              ),
            );
          }

          return const Placeholder();
        },
      ),
    );
  }
}
