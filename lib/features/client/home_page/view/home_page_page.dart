// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/client/home_page/bloc/bloc.dart';
import 'package:gestao_restaurante/features/client/home_page/cubit/best_sallers_horizontal_cubit.dart';
import 'package:gestao_restaurante/features/client/home_page/cubit/categorias_horizontal_cubit.dart';
import 'package:gestao_restaurante/features/client/home_page/cubit/produto_por_categoria_horizontal_cubit.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/home_page_body.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/home_page_drawer.dart';

/// {@template home_page_page}
/// A description for HomePagePage
/// {@endtemplate}
class HomePagePage extends StatelessWidget {
  /// {@macro home_page_page}
  const HomePagePage({super.key});

  /// The static route for HomePagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePagePage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageBloc(),
        ),
        BlocProvider(
          create: (context) => BestSallersHorizontalCubit(),
        ),
        BlocProvider(
          create: (context) => ProdutoPorCategoriaHorizontalCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriasHorizontalCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Na Garagem'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            ),
          ],
        ),
        drawer: const HomePageDrawer(),
        body: const HomePageView(),
      ),
    );
  }
}

/// {@template home_page_view}
/// Displays the Body of HomePageView
/// {@endtemplate}
class HomePageView extends StatelessWidget {
  /// {@macro home_page_view}
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context
            .read<BestSallersHorizontalCubit>()
            .getBestSellerProducts(inCache: false);

        await context
            .read<CategoriasHorizontalCubit>()
            .getCategorias(cache: false);

        // atualiza os produtos por categoria
        await context
            .read<ProdutoPorCategoriaHorizontalCubit>()
            .getProdutosPorCategoria(
              cache: false,
            );
      },
      child: const HomePageBody(),
    );
  }
}
