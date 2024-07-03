// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/global/item_details/view/item_details_page.dart';
import 'package:gestao_restaurante/global/widgets/global_image_network_widget.dart';

class BestSellerHorizontalListItem extends StatelessWidget {
  const BestSellerHorizontalListItem({
    required this.item,
    super.key,
  });

  final ItemModel item;

  String? _getImage(List<String> images) {
    if (images.isEmpty) return null;

    return item.imagemUrl.length == 1
        ? images.first
        : images[Random.secure().nextInt(images.length)];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, ItemDetailsPage.route(item));
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
                _getImage(item.imagemUrl),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   padding: const EdgeInsets.all(4),
                  //   margin: const EdgeInsets.all(4),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     color: Colors.white,
                  //   ),
                  //   child: const Icon(
                  //     Icons.favorite_border,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  const SizedBox(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8),
                    ),
                    child: Text(
                      item.categoria.descricao,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 13,
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
