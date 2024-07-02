import 'package:flutter/material.dart';
import 'package:gestao_restaurante/global/widgets/padding_widget.dart';

class InitialMessage extends StatelessWidget {
  const InitialMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return PadWid(
      child: Text(
        'Temos para si varios sabores para sua refeição',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
