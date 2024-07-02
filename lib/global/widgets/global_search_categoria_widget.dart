import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/admin/gestao_categoria/view/gestao_categoria_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class GlobalSearchCategoriaWidget extends StatelessWidget {
  const GlobalSearchCategoriaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => const GestaoCategoriaPage(),
        );
      },
      icon: const Icon(Icons.search),
    );
  }
}
