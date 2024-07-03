// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/global/widgets/global_image_network_widget.dart';

class ProdutoItemListView extends StatelessWidget {
  const ProdutoItemListView({
    required this.item,
    super.key,
    this.onTap,
  });

  final ItemModel item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        item.nome,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Text(item.categoria.descricao),
      leading: _ImageWidget(
        url: item.imagemUrl[Random().nextInt(item.imagemUrl.length)],
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GlobalImageNetworkWidget(
        url,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }
}
