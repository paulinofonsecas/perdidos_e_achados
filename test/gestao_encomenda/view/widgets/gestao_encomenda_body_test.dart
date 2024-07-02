// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/gestao_encomenda.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GestaoEncomendaBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => GestaoEncomendaBloc(),
          child: MaterialApp(home: GestaoEncomendaBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
