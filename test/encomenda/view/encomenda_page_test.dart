// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/features/client/encomenda/encomenda.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EncomendaPage', () {
    group('route', () {
      test('is routable', () {
        expect(EncomendaPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders EncomendaView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: EncomendaPage()));
      expect(find.byType(EncomendaView), findsOneWidget);
    });
  });
}
