import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/features/client/home_page/cubit/produto_por_categoria_horizontal_cubit.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/produto_por_categoria_listitem.dart';

class ProdutosPorCategoriaGrid extends StatelessWidget {
  const ProdutosPorCategoriaGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProdutoPorCategoriaHorizontalCubit,
        ProdutoPorCategoriaHorizontalState>(
      bloc: context.read<ProdutoPorCategoriaHorizontalCubit>()
        ..getProdutosPorCategoria(),
      listener: (context, state) {
        if (state is ProdutoPorCategoriaHorizontalError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProdutoPorCategoriaHorizontalLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProdutoPorCategoriaHorizontalEmpty) {
          return const Center(
            child: Text('Nenhum item encontrado'),
          );
        }

        if (state is ProdutoPorCategoriaHorizontalSuccess) {
          final produtos = state.produtoPorCategoria;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              childAspectRatio: 0.7,
            ),
            shrinkWrap: true,
            itemCount: produtos.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ProdutoPorCategoriaListItem(
              produto: produtos[index],
            ),
          );
        }

        return const Placeholder();
      },
    );
  }
}
