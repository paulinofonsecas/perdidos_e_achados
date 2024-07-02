// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/produto_model.dart';
import 'package:gestao_restaurante/features/client/encomenda/bloc/bloc.dart';
import 'package:gestao_restaurante/features/client/encomenda/cubit/gestao_encomendas_cubit.dart';
import 'package:gestao_restaurante/features/client/encomenda/cubit/gestao_encomendas_feitas_cubit.dart';
import 'package:gestao_restaurante/features/client/encomenda/widgets/encomenda_body.dart';

/// {@template encomenda_page}
/// A description for EncomendaPage
/// {@endtemplate}
class EncomendaPage extends StatelessWidget {
  const EncomendaPage({required this.produto, super.key});

  static Route<dynamic> route(ProdutoModel produto) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => EncomendaPage(
        produto: produto,
      ),
    );
  }

  final ProdutoModel produto;

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
          produto: produto,
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
    required this.produto,
    super.key,
  });

  final ProdutoModel produto;

  @override
  Widget build(BuildContext context) {
    return EncomendaBody(
      produto: produto,
    );
  }
}
