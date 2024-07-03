import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/features/admin/add_produto/cubit/localizacao_input_cubit.dart';

class LocalDoItemPerdidoInputField extends StatelessWidget {
  const LocalDoItemPerdidoInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (t) {
        context.read<LocalizacaoInputCubit>().onChanged(t);
      },
      decoration: const InputDecoration(
        labelText: 'Localização da perda',
        border: OutlineInputBorder(),
      ),
    );
  }
}
