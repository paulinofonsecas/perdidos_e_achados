import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/preco_input_cubit.dart';

class PrecoInputField extends StatelessWidget {
  const PrecoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      onChanged: (value) {
        value = value.replaceAll(',', '.');
        context.read<PrecoInputCubit>().onChanged(value);
      },
      decoration: const InputDecoration(
        labelText: 'Preço',
        hintText: '2.500,00',
        border: OutlineInputBorder(),
      ),
    );
  }
}
