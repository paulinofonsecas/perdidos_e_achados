import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/global/authentication/cubit/email_field_cubit.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, informe seu email';
        }

        if (!value.contains('@')) {
          return 'Por favor, informe um email valido';
        }

        if (!value.contains('.')) {
          return 'Por favor, informe um email valido';
        }

        return null;
      },
      onChanged: (value) => context.read<EmailFieldCubit>().updateEmail(value),
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        prefixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }
}
