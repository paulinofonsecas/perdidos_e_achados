import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestao_restaurante/global/authentication/cubit/password_field_cubit.dart';

class RepeatPasswordFieldWidget extends StatelessWidget {
  const RepeatPasswordFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final password = context.watch<PasswordFieldCubit>().state.password;

    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, informe sua senha';
        }

        if (value.length < 6) {
          return 'Sua senha deve conter pelo menos 6 caracteres';
        }

        if (value != password) {
          return 'As senhas devem ser iguais';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirmar senha',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        prefixIcon: const Icon(Icons.password_outlined),
      ),
    );
  }
}
