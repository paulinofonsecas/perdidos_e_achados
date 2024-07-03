import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/global/global_search_categoria/bloc/bloc.dart';
import 'package:gestao_restaurante/global/widgets/global_image_network_widget.dart';
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
      child: BlocBuilder<GlobalSearchCategoriaBloc, GlobalSearchCategoriaState>(
        bloc: context.read<GlobalSearchCategoriaBloc>()
          ..add(const CustomGlobalSearchCategoriaEvent()),
        builder: (context, state) {
          if (state is GlobalSearchCategoriaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GlobalSearchCategoriaError) {
            return const Center(
              child: Text('Ups, algo deu errado'),
            );
          }

          if (state is GlobalSearchCategoriaSuccess) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Pesquisar itens',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton.filledTonal(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
                const GutterTiny(),
                Expanded(child: _body(state)),
              ],
            );
          }

          return const Placeholder();
        },
      ),
    );
  }

  SearchableList<ItemModel> _body(GlobalSearchCategoriaSuccess state) {
    return SearchableList<ItemModel>(
      initialList: state.items,
      itemBuilder: (ItemModel item) => SearchedListItem(item: item),
      filter: (String value) => state.items.where(
        (element) {
          final elementNome =
              element.nome.toLowerCase().contains(value.toLowerCase());

          final elementDesc =
              element.descricao.toLowerCase().contains(value.toLowerCase());

          return elementNome || elementDesc;
        },
      ).toList(),
      emptyWidget: const Placeholder(),
      inputDecoration: InputDecoration(
        hintText: 'Pesquisar itens',
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class SearchedListItem extends StatelessWidget {
  const SearchedListItem({
    required this.item,
    super.key,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.nome),
      subtitle: Text(item.descricao),
      leading: GlobalImageNetworkWidget(
        item.imagemUrl[Random().nextInt(item.imagemUrl.length)],
        width: 60,
      ),
    );
  }
}
