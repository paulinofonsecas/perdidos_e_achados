import 'package:flutter/material.dart';
import 'package:gestao_restaurante/global/global_search_categoria/bloc/bloc.dart';
import 'package:gestao_restaurante/global/global_search_categoria/cubit/search_list_books_cubit.dart';
import 'package:gestao_restaurante/global/global_search_categoria/widgets/global_search_categoria_body.dart';

/// {@template global_search_categoria_page}
/// A description for GlobalSearchCategoriaPage
/// {@endtemplate}
class GlobalSearchCategoriaPage extends StatelessWidget {
  /// {@macro global_search_categoria_page}
  const GlobalSearchCategoriaPage({super.key});

  /// The static route for GlobalSearchCategoriaPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GlobalSearchCategoriaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalSearchCategoriaBloc(),
        ),
        BlocProvider(
          create: (context) => SearchListBooksCubit(),
        ),
      ],
      child: const GlobalSearchCategoriaView(),
    );
  }
}

/// {@template global_search_categoria_view}
/// Displays the Body of GlobalSearchCategoriaView
/// {@endtemplate}
class GlobalSearchCategoriaView extends StatelessWidget {
  /// {@macro global_search_categoria_view}
  const GlobalSearchCategoriaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalSearchCategoriaBody();
  }
}
