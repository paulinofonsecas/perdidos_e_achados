// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:gestao_restaurante/features/client/encomenda/view/encomenda_page.dart';
import 'package:gestao_restaurante/global/product_detail/widgets/carrousel_images.dart';
import 'package:gestao_restaurante/global/product_detail/widgets/product_info_widget.dart';

/// {@template product_detail_body}
/// Body of the ProductDetailPage.
///
/// Add what it does
/// {@endtemplate}
class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({super.key});

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  @override
  Widget build(BuildContext context) {
    final item = getIt<ItemModel>();

    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarrouselImages(item: item),
            ProductInfoWidget(item: item),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 2,
            ),
            child: FilledButton.icon(
              onPressed: () {
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return EncomendaPage(
                //       produto: item,
                //     );
                //   },
                // );
                // Navigator.push(context, EncomendaPage.route());
              },
              label: const Text('Entrar em contacto'),
              icon: const Icon(Icons.call),
            ),
          ),
        ),
      ],
    );
  }
}
