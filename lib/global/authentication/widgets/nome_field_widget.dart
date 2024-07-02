import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/global/authentication/cubit/nome_field_cubit.dart';

class NomeFieldWidget extends StatelessWidget {
  const NomeFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, informe seu nome';
        }

        return null;
      },
      onChanged: (value) => context.read<NomeFieldCubit>().updateNome(value),
      decoration: InputDecoration(
        labelText: 'Nome completo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        prefixIcon: const Icon(Icons.person_3_outlined),
      ),
    );
  }
}
