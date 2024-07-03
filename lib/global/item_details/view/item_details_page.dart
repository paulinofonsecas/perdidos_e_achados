import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/global/item_details/bloc/item_details_bloc.dart';
import 'package:gestao_restaurante/global/item_details/widgets/item_details_body.dart';

/// {@template item_details_page}
/// A description for ItemDetailsPage
/// {@endtemplate}
class ItemDetailsPage extends StatelessWidget {
  /// {@macro item_details_page}
  const ItemDetailsPage({required this.item, super.key});

  final ItemModel item;

  /// The static route for ItemDetailsPage
  static Route<dynamic> route(ItemModel item) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => ItemDetailsPage(item: item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemDetailsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pasta de couro preta'),
        ),
        body: ItemDetailsView(item: item),
      ),
    );
  }
}

/// {@template item_details_view}
/// Displays the Body of ItemDetailsView
/// {@endtemplate}
class ItemDetailsView extends StatelessWidget {
  /// {@macro item_details_view}
  const ItemDetailsView({required this.item, super.key});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return ItemDetailsBody(item: item);
  }
}
