// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GlobalLogoWidget extends StatelessWidget {
  const GlobalLogoWidget({
    super.key,
    this.size,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: SizedBox.square(
        dimension: size ?? 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: Image.asset(
            'assets/imgs/logo.jpg',
          ),
        ),
      ),
    );
  }
}
