// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/entidades/promocao_model.dart';
import 'package:gestao_restaurante/global/widgets/global_image_network_widget.dart';

class PromocoesWidget extends StatefulWidget {
  const PromocoesWidget({super.key});

  @override
  State<PromocoesWidget> createState() => _PromocoesWidgetState();
}

class _PromocoesWidgetState extends State<PromocoesWidget> {
  @override
  Widget build(BuildContext context) {
    final promocoes = [
      PromocaoModel.fake(
        descricao: 'Hamburger composto',
        percentualDeDesconto: 45,
      ),
      PromocaoModel.fake(
        descricao: 'Frango panado',
        percentualDeDesconto: 20,
      ),
      PromocaoModel.fake(
        descricao: 'Bifana no prato',
        percentualDeDesconto: 5,
      ),
      PromocaoModel.fake(
        descricao: 'Costelas a portuguesa',
        percentualDeDesconto: 15,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Text(
            'Promoções',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 168,
            viewportFraction: .9,
            enlargeFactor: .2,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
          ),
          items: promocoes.map((i) {
            return _PromocaoItemWidget(i);
          }).toList(),
        ),
      ],
    );
  }
}

class _PromocaoItemWidget extends StatelessWidget {
  const _PromocaoItemWidget(
    this.promocao,
  );

  final PromocaoModel promocao;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 224, 85, 39),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      promocao.descricao,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '-${promocao.percentualDeDesconto}%',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: GlobalImageNetworkWidget(
                  promocao.imagemUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
