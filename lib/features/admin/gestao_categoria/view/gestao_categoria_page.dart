import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/admin/gestao_categoria/bloc/bloc.dart';
import 'package:gestao_restaurante/features/admin/gestao_categoria/widgets/gestao_categoria_body.dart';

/// {@template gestao_categoria_page}
/// A description for GestaoCategoriaPage
/// {@endtemplate}
class GestaoCategoriaPage extends StatelessWidget {
  /// {@macro gestao_categoria_page}
  const GestaoCategoriaPage({super.key});

  /// The static route for GestaoCategoriaPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GestaoCategoriaPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GestaoCategoriaBloc(),
      child: const GestaoCategoriaView(),
    );
  }
}

/// {@template gestao_categoria_view}
/// Displays the Body of GestaoCategoriaView
/// {@endtemplate}
class GestaoCategoriaView extends StatelessWidget {
  /// {@macro gestao_categoria_view}
  const GestaoCategoriaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestaoCategoriaBody();
  }
}
