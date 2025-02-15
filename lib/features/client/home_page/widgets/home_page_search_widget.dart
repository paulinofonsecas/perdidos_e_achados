// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class HomePageSearchWidget extends StatelessWidget {
  const HomePageSearchWidget({
    required this.onTap,
    super.key,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary.withOpacity(0.02),
          border: Border.all(
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            const GutterTiny(),
            Text(
              'Pesquise por items',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black.withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
