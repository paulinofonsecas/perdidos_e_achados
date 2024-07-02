// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/categoria_model.dart';

class CategoriaHorizontalListItem extends StatelessWidget {
  const CategoriaHorizontalListItem({
    required this.categoria,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final CategoriaModel categoria;
  final bool isActive;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isActive
              ? Colors.white
              : Theme.of(context).colorScheme.primary.withOpacity(0.1),
          border: Border.all(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // const Icon(
            //   Icons.fastfood,
            //   color: Colors.orange,
            //   size: 14,
            // ),
            // const GutterSmall(),
            Text(
              categoria.descricao,
              style: TextStyle(
                color: isActive
                    ? Colors.black
                    : Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
