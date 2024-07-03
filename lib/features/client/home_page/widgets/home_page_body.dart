import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/best_sellers_horizontal_list.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/categorias_horizontal_list.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/header_widget.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/home_page_search_widget.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/produtos_por_categoria_list.dart';
import 'package:gestao_restaurante/global/global_search_categoria/view/global_search_categoria_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// {@template home_page_body}
/// Body of the HomePagePage.
///
/// Add what it does
/// {@endtemplate}
class HomePageBody extends StatelessWidget {
  /// {@macro home_page_body}
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget(),
          HomePageSearchWidget(
            onTap: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) {
                  return const Material(child: GlobalSearchCategoriaPage());
                },
              );
            },
          ),
          // const Gutter(),
          // const PromocoesWidget(),
          const Gutter(),
          const BestSallersHorizontalList(),
          const Gutter(),
          const CategoriasHorizontalList(),
          const Gutter(),
          const ProdutosPorCategoriaGrid(),
        ],
      ),
    );
  }
}
