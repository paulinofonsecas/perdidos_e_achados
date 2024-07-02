import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';
import 'package:gestao_restaurante/features/client/home_page/cubit/categorias_horizontal_cubit.dart';
import 'package:gestao_restaurante/features/client/home_page/cubit/produto_por_categoria_horizontal_cubit.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/categoria_horizontal_listitem.dart';
import 'package:gestao_restaurante/global/widgets/padding_widget.dart';

class CategoriasHorizontalList extends StatefulWidget {
  const CategoriasHorizontalList({super.key});

  @override
  State<CategoriasHorizontalList> createState() =>
      _CategoriasHorizontalListState();
}

class _CategoriasHorizontalListState extends State<CategoriasHorizontalList> {
  int currentIndex = 0;

  @override
  void initState() {
    context.read<CategoriasHorizontalCubit>().getCategorias();
    super.initState();
  }

  void _onTap(int index, CategoriaModel categoria) {
    setState(() {
      currentIndex = index;
    });
    context.read<ProdutoPorCategoriaHorizontalCubit>().getProdutosPorCategoria(
          categoria: categoria,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PadWid(
          child: Text(
            'Categorias',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const GutterTiny(),
        BlocConsumer<CategoriasHorizontalCubit, CategoriasHorizontalState>(
          listener: (context, state) {
            if (state is CategoriasHorizontalError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CategoriasHorizontalLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CategoriasHorizontalEmpty) {
              return const Center(
                child: Text('Nenhum item encontrado'),
              );
            }

            if (state is CategoriasHorizontalSuccess) {
              final categorias = state.categorias;

              return SizedBox(
                height: 45,
                child: ListView.builder(
                  itemCount: categorias.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoriaHorizontalListItem(
                    isActive: index == currentIndex,
                    categoria: categorias[index],
                    onTap: () {
                      _onTap(index, categorias[index]);
                    },
                  ),
                ),
              );
            }

            return const Placeholder();
          },
        ),
      ],
    );
  }
}
