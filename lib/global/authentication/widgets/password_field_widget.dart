import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/global/authentication/cubit/password_field_cubit.dart';

class PasswordFieldWidget extends StatelessWidget {
  const PasswordFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, informe sua senha';
        }

        if (value.length < 6) {
          return 'Sua senha deve conter pelo menos 6 caracteres';
        }

        return null;
      },
      onChanged: (value) =>
          context.read<PasswordFieldCubit>().updatePassword(value),
      decoration: InputDecoration(
        labelText: 'Senha',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        prefixIcon: const Icon(Icons.password),
      ),
    );
  }
}
