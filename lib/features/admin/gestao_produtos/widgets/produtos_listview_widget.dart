import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/widgets/filter_widget.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/widgets/produto_item_listview.dart';
import 'package:gestao_restaurante/global/product_detail/view/product_detail_page.dart';

class ProdutosListviewWidget extends StatefulWidget {
  const ProdutosListviewWidget({required this.items, super.key});

  final List<ItemModel> items;

  @override
  State<ProdutosListviewWidget> createState() => _ProdutosListviewWidgetState();
}

class _ProdutosListviewWidgetState extends State<ProdutosListviewWidget> {
  late final TextEditingController _searchController;
  String filter = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _searchController.addListener(() {
      setState(() {
        filter = _searchController.text;
      });
    });
  }

  List<Widget> _getProdutosList(List<ItemModel> items) {
    return items
        .where(
          (e) => e.nome.toLowerCase().contains(filter.trim().toLowerCase()),
        )
        .map(
          (item) => ProdutoItemListView(
            item: item,
            onTap: () {
              Navigator.push(
                context,
                ProductDetailPage.route(item),
              );
            },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchFieldWidget(_searchController),
        Expanded(
          child: ListView(
            children: _getProdutosList(widget.items),
          ),
        ),
      ],
    );
  }
}

class _SearchFieldWidget extends StatelessWidget {
  const _SearchFieldWidget(this.controller);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Pesquisar',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: controller.clear,
                      )
                    : null,
              ),
            ),
          ),
          const GutterTiny(),
          const FilterWidget(),
        ],
      ),
    );
  }
}
