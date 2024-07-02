// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/client/encomenda/encomenda.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EncomendaBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => EncomendaBloc(),
          child: MaterialApp(home: EncomendaBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
