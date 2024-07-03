// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:gestao_restaurante/features/admin/add_produto/view/add_produto_page.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/bloc/bloc.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/cubit/fielter_cubit.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/widgets/gestao_produtos_body.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/widgets/gestao_produtos_drawer.dart';

/// {@template gestao_produtos_page}
/// A description for GestaoProdutosPage
/// {@endtemplate}
class GestaoProdutosPage extends StatelessWidget {
  /// {@macro gestao_produtos_page}
  GestaoProdutosPage({super.key}) {
    if (getIt.isRegistered<FilterCubit>()) {
      getIt.unregister<FilterCubit>();
    }

    getIt.registerSingleton(FilterCubit());
  }

  /// The static route for GestaoProdutosPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => GestaoProdutosPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GestaoProdutosBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<FilterCubit>(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Gestão de Items'),
              // actions: [
              //   TextButton(
              //     onPressed: () async {
              //       // await populateProducts().then((e) {
              //       //   print('Populou');
              //       // });
              //     },
              //     child: const Text('Atualizar'),
              //   ),
              // ],
            ),
            drawer: const GestaoProdutosDrawer(),
            body: const GestaoProdutosView(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, AddProdutoPage.route());
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

/// {@template gestao_produtos_view}
/// Displays the Body of GestaoProdutosView
/// {@endtemplate}
class GestaoProdutosView extends StatelessWidget {
  /// {@macro gestao_produtos_view}
  const GestaoProdutosView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GestaoProdutosBloc>().add(
              GetAllProdutosEvent(
                inCache: false,
                ordenacao: getIt<FilterCubit>().state.ordenacao,
              ),
            );
      },
      child: const GestaoProdutosBody(),
    );
  }
}
