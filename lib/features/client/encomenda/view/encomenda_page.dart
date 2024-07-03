// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/item_model.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/features/client/encomenda/bloc/bloc.dart';
import 'package:gestao_restaurante/features/client/encomenda/cubit/gestao_encomendas_cubit.dart';
import 'package:gestao_restaurante/features/client/encomenda/cubit/gestao_encomendas_feitas_cubit.dart';
import 'package:gestao_restaurante/features/client/encomenda/widgets/encomenda_body.dart';

/// {@template encomenda_page}
/// A description for EncomendaPage
/// {@endtemplate}
class EncomendaPage extends StatelessWidget {
  const EncomendaPage({required this.item, super.key});

  static Route<dynamic> route(ItemModel item) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EncomendaPage(
        item: item,
      ),
    );
  }

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EncomendaBloc(),
        ),
        BlocProvider(
          create: (context) => GestaoEncomendasFeitasCubit(),
        ),
        BlocProvider(
          create: (context) => GestaoEncomendasCubit(),
        ),
      ],
      child: Scaffold(
        body: EncomendaView(
          item: item,
        ),
      ),
    );
  }
}

/// {@template encomenda_view}
/// Displays the Body of EncomendaView
/// {@endtemplate}
class EncomendaView extends StatelessWidget {
  /// {@macro encomenda_view}
  const EncomendaView({
    required this.item,
    super.key,
  });

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return EncomendaBody(
      item: item,
    );
  }
}
