import 'package:flutter/material.dart';

class IngredienteInputField extends StatelessWidget {
  const IngredienteInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Ingrediente',
        border: OutlineInputBorder(),
      ),
    );
  }
}
