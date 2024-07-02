import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/disponibilidade_field_cubit.dart';

class DisponibilidadeInputField extends StatelessWidget {
  const DisponibilidadeInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisponibilidadeFieldCubit, DisponibilidadeFieldState>(
      builder: (context, state) {
        return SwitchListTile(
          value: state.disponibilidade,
          onChanged: (value) {
            context.read<DisponibilidadeFieldCubit>().onChanged(value);
          },
          title: const Text('Disponível'),
        );
      },
    );
  }
}
