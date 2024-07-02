import 'package:flutter/material.dart';
import 'package:gestao_restaurante/dados/servicos/login_firebase.dart';
import 'package:gestao_restaurante/global/authentication/view/authentication_page.dart';
import 'package:gestao_restaurante/global/global_logo_widget.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: const Center(
                  child: GlobalLogoWidget(),
                ),
              ),
            ),
            const ListTile(
              title: Text('Protos salvos'),
              leading: Icon(Icons.bookmark_outline),
            ),
            const Divider(),
            ListTile(
              onTap: () async {
                await LoginFirebase.instance
                    .logout()
                    .then(
                      (value) => Navigator.of(context)
                          .pushReplacement(AuthenticationPage.route()),
                    )
                    .onError((e, t) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Erro ao encerrar sessão'),
                    ),
                  );
                });
              },
              title: const Text('Terminar Sessão'),
              leading: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
