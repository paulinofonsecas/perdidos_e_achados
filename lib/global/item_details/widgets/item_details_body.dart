// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/features/client/encomenda/view/encomenda_page.dart';
import 'package:gestao_restaurante/global/item_details/widgets/carrousel_images.dart';
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
            // _BotaoResgatar(item),
          ],
        ),
      ),
    );
  }
}

class _BotaoResgatar extends StatelessWidget {
  const _BotaoResgatar(this.item);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return EncomendaPage(
              item: item,
            );
          },
        );
        Navigator.push(context, EncomendaPage.route(item));
      },
      child: Container(
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
