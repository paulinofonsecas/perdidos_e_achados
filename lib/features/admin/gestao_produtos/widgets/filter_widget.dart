import 'package:flutter/material.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/dados/models/ordenacao.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/cubit/fielter_cubit.dart';
import 'package:gestao_restaurante/global/authentication/bloc/bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<FilterCubit>().state.ordenacao;

    return IconButton(
      icon: const Icon(Icons.sort_by_alpha),
      onPressed: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Align(
                  child: Text(
                    'Ordenar por',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  context
                      .read<FilterCubit>()
                      .changeFilter(Ordenacao.alfabetica);
                },
                title: Text(
                  'Nome',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: filter == Ordenacao.dataAdicao
                            ? FontWeight.bold
                            : null,
                      ),
                ),
                leading: filter == Ordenacao.dataAdicao
                    ? const Icon(Icons.swap_vert_circle_outlined)
                    : null,
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                onTap: () {
                  context
                      .read<FilterCubit>()
                      .changeFilter(Ordenacao.dataAdicao);
                },
                title: Text(
                  'Data de adição',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: filter == Ordenacao.dataAdicao
                            ? FontWeight.bold
                            : null,
                      ),
                ),
                leading: filter == Ordenacao.dataAdicao
                    ? const Icon(Icons.swap_vert_circle_outlined)
                    : null,
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                onTap: () {
                  context
                      .read<FilterCubit>()
                      .changeFilter(Ordenacao.dataPerdido);
                },
                title: Text(
                  'Data de perdido',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: filter == Ordenacao.dataPerdido
                            ? FontWeight.bold
                            : null,
                      ),
                ),
                leading: filter == Ordenacao.dataPerdido
                    ? const Icon(Icons.swap_vert_circle_outlined)
                    : null,
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        );
      },
    );
  }
}
