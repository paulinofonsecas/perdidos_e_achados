import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/global/widgets/global_image_network_widget.dart';

class CarrouselImages extends StatelessWidget {
  const CarrouselImages({
    required this.produto,
    super.key,
  });

  final ProdutoModel produto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          reverse: true,
          viewportFraction: .9,
          enlargeFactor: .2,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
        ),
        items: produto.imagemUrl.map((i) {
          return _ImageItemWidget(
            url: i,
          );
        }).toList(),
      ),
    );
  }
}

class _ImageItemWidget extends StatelessWidget {
  const _ImageItemWidget({
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
      ),
      child: GlobalImageNetworkWidget(
        url,
        width: 300,
      ),
    );
  }
}
