// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    required this.item,
    super.key,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.nome,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.categoria.descricao,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Row(
              //   children: [
              //     Text(
              //       'Disponivel',
              //       style: Theme.of(context)
              //           .textTheme
              //           .labelLarge
              //           ?.copyWith(color: Colors.black),
              //     ),
              //     const Icon(
              //       Icons.check,
              //       color: Colors.greenAccent,
              //     ),
              //   ],
              // ),
            ],
          ),
          const Gutter(),
          const Divider(),
          const Gutter(),
          Text(
            'Descrição',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            item.descricao,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                  fontSize: 15,
                ),
          ),
        ],
      ),
    );
  }
}
