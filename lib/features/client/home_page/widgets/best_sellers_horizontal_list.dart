import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:gestao_restaurante/features/client/home_page/cubit/best_sallers_horizontal_cubit.dart';
import 'package:gestao_restaurante/features/client/home_page/widgets/best_seller_horizontal_listitem.dart';
import 'package:gestao_restaurante/global/widgets/padding_widget.dart';

class BestSallersHorizontalList extends StatelessWidget {
  const BestSallersHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PadWid(
          child: Text(
            'Pratos do dia',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const GutterTiny(),
        BlocConsumer<BestSallersHorizontalCubit, BestSallersHorizontalState>(
          bloc: context.read<BestSallersHorizontalCubit>()
            ..getBestSellerProducts(),
          listener: (context, state) {
            if (state is BestSallersHorizontalError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is BestSallersHorizontalLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is BestSallersHorizontalEmpty) {
              return const Center(
                child: Text('Nenhum item encontrado'),
              );
            }

            if (state is BestSallersHorizontalSuccess) {
              final products = state.bestSallers;

              return SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BestSellerHorizontalListItem(
                    produto: products[index],
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
