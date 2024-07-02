import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/client/encomenda/cubit/gestao_encomendas_cubit.dart';
import 'package:gestao_restaurante/features/client/encomenda/cubit/gestao_encomendas_feitas_cubit.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/bloc/bloc.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/widgets/gestao_encomenda_body.dart';

/// {@template gestao_encomenda_page}
/// A description for GestaoEncomendaPage
/// {@endtemplate}
class GestaoEncomendaPage extends StatelessWidget {
  /// {@macro gestao_encomenda_page}
  const GestaoEncomendaPage({super.key});

  /// The static route for GestaoEncomendaPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GestaoEncomendaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GestaoEncomendaBloc(),
        ),
        BlocProvider(
          create: (context) => GestaoEncomendasCubit(),
        ),
        BlocProvider(
          create: (context) => GestaoEncomendasFeitasCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Encomendas em aberto'),
        ),
        body: const GestaoEncomendaView(),
      ),
    );
  }
}

/// {@template gestao_encomenda_view}
/// Displays the Body of GestaoEncomendaView
/// {@endtemplate}
class GestaoEncomendaView extends StatelessWidget {
  /// {@macro gestao_encomenda_view}
  const GestaoEncomendaView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<GestaoEncomendaBloc>()
            .add(const GestaoEncomendaGetAllEvent());
      },
      child: const GestaoEncomendaBody(),
    );
  }
}
