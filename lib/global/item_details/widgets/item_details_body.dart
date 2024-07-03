// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/global/product_detail/widgets/carrousel_images.dart';
import 'package:gestao_restaurante/helpers.dart';

/// {@template item_details_body}
/// Body of the ItemDetailsPage.
///
/// Add what it does
/// {@endtemplate}
class ItemDetailsBody extends StatelessWidget {
  /// {@macro item_details_body}
  const ItemDetailsBody({required this.item, super.key});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarrouselImages(
              item: item,
              isTapping: true,
            ),
            const GutterLarge(),
            Text(
              'Pasta preta de couro',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Gutter(),
            ColumnInfoWidget(
              title: 'Perdido em',
              icon: Icons.location_pin,
              info: item.localEncontrado ?? 'N/D',
            ),
            const Gutter(),
            ColumnInfoWidget(
              title: 'Data',
              icon: Icons.calendar_month,
              info: normalizeDate(item.dataItemPerdido ?? DateTime.now()),
            ),
            const GutterLarge(),
            const _DescriptionWidget(),
            const GutterLarge(),
            const _BotaoResgatar(),
          ],
        ),
      ),
    );
  }
}

class _BotaoResgatar extends StatelessWidget {
  const _BotaoResgatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'Resgatar item',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição',
          maxLines: 2,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        Text(
          'Deixou um objeto perdido no veículo solicitado pelo app da Uber? '
          'Deixou um objeto perdido no veículo solicitado pelo app da Uber? '
          'Deixou um objeto perdido no veículo solicitado pelo app da Uber? '
          'Veja como proceder para entrar em contato e recuperar seus pertences',
          style: TextStyle(
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-aAc2hyGWJ67kqH3I1ZK-O0EJFzz52h2siQFO3njSLbLgiD7yNFXHhFjShsEeS_9_zEw&usqp=CAU',
          width: double.infinity,
          height: size.height * .4,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ColumnInfoWidget extends StatelessWidget {
  const ColumnInfoWidget({
    required this.title,
    required this.icon,
    required this.info,
    super.key,
  });

  final String title;
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
        const GutterSmall(),
        Row(
          children: [
            Icon(
              icon,
              color: Colors.blue[300],
            ),
            const GutterSmall(),
            Text(
              info,
              maxLines: 2,
              style: TextStyle(
                color: Colors.blue[300],
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
