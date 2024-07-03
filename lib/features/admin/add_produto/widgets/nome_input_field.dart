import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/nome_input_cubit.dart';

class NomeInputField extends StatelessWidget {
  const NomeInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (t) {
        context.read<NomeInputCubit>().onChanged(t);
      },
      validator: (t) {
        if (t == null || t.isEmpty) {
          return 'Insira um nome';
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Nome',
        border: OutlineInputBorder(),
      ),
    );
  }
}
