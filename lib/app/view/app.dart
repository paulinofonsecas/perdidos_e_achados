import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gestao_restaurante/constants.dart';
import 'package:gestao_restaurante/features/admin/gestao_produtos/gestao_produtos.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/view/gestao_encomenda_page.dart';
import 'package:gestao_restaurante/features/client/home_page/view/home_page_page.dart';
import 'package:gestao_restaurante/global/authentication/authentication.dart';
import 'package:gestao_restaurante/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // setUpProject();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.cyanColor),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      home: const GestaoProdutosPage(),
      routes: {
        '/home-page': (context) => const HomePagePage(),
        '/gestao/encomendas': (context) => const GestaoEncomendaPage(),
        '/gestao-produtos': (context) => const GestaoProdutosPage(),
      },
    );
  }
}
