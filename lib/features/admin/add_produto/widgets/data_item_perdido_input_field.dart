// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/data_item_perdido_cubit.dart';
import 'package:gestao_restaurante/helpers.dart';

class DataItemPerdidoInputField extends StatelessWidget {
  const DataItemPerdidoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onTap() async {
      final result = await showDatePicker(
        context: context,
        locale: const Locale('pt', 'BR'),
        firstDate: DateTime.now().subtract(const Duration(days: 365 * 2)),
        lastDate: DateTime.now(),
      );

      if (result != null) {
        context.read<DataItemPerdidoCubit>().changeDate(result);
      }
    }

    return BlocBuilder<DataItemPerdidoCubit, DataItemPerdidoState>(
      bloc: context.read<DataItemPerdidoCubit>(),
      builder: (context, state) {
        if (state is DataItemPerdidoDateChanged) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Perdido aos: ${normalizeDate(state.date)}',
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.refresh),
              ),
            ],
          );
        }

        return ListTile(
          title: const Text(
            'Selecione a data em que o \nitem foi perdido',
            textAlign: TextAlign.center,
          ),
          onTap: onTap,
          trailing: const Icon(Icons.calendar_month),
        );
      },
    );
  }
}
