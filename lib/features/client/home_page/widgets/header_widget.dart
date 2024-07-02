import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/entidades/local_user.dart';
import 'package:gestao_restaurante/dependencies.dart';
import 'package:gestao_restaurante/global/global_logo_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  String get mensagem {
    final horaAtual = DateTime.now().hour;

    if (horaAtual < 12) {
      return 'Bom dia';
    } else if (horaAtual < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }

  @override
  Widget build(BuildContext context) {
    final nome = getIt<LocalUser>().nome;
    // const nome = 'Avelino Chivela';

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$mensagem,',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '$nome!',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 20,
                  ),
                  Text(
                    'Silva porto, Cuito, Bié',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Align(
            alignment: Alignment.topRight,
            child: GlobalLogoWidget(size: 80),
          ),
        ],
      ),
    );
  }
}
