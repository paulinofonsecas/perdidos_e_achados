import 'package:flutter/material.dart';
import 'package:gestao_restaurante/constants.dart';

class PadWid extends StatelessWidget {
  const PadWid({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: child,
    );
  }
}
