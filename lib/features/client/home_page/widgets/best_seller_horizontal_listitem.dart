// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/global/product_detail/view/product_detail_page.dart';
import 'package:gestao_restaurante/global/widgets/global_image_network_widget.dart';

class BestSellerHorizontalListItem extends StatelessWidget {
  const BestSellerHorizontalListItem({
    required this.produto,
    super.key,
  });

  final ProdutoModel produto;

  String? _getImage(List<String> images) {
    if (images.isEmpty) return null;

    return produto.imagemUrl.length == 1
        ? images.first
        : images[Random.secure().nextInt(images.length)];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, ProductDetailPage.route(produto));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 150,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          alignment: Alignment.bottomRight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              GlobalImageNetworkWidget(
                _getImage(produto.imagemUrl),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Text(
                      '${produto.preco} Kz',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
