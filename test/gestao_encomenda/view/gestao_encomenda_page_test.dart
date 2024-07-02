// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/gestao_encomenda.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GestaoEncomendaPage', () {
    group('route', () {
      test('is routable', () {
        expect(GestaoEncomendaPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders GestaoEncomendaView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: GestaoEncomendaPage()));
      expect(find.byType(GestaoEncomendaView), findsOneWidget);
    });
  });
}
