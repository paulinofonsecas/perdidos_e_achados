import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/admin/gestao_categoria/bloc/bloc.dart';

/// {@template gestao_categoria_body}
/// Body of the GestaoCategoriaPage.
///
/// Add what it does
/// {@endtemplate}
class GestaoCategoriaBody extends StatelessWidget {
  /// {@macro gestao_categoria_body}
  const GestaoCategoriaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestaoCategoriaBloc, GestaoCategoriaState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
