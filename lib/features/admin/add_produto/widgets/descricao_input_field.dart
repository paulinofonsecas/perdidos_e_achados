import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/descricao_input_cubit.dart';

class DescricaoInputField extends StatelessWidget {
  const DescricaoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (t) {
        context.read<DescricaoInputCubit>().onChanged(t);
      },
      validator: (t) {
        if (t == null || t.isEmpty) {
          return 'Insira uma descrição do item perdido';
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Descrição',
        border: OutlineInputBorder(),
      ),
    );
  }
}
