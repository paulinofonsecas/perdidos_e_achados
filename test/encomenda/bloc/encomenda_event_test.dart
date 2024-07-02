// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/features/client/encomenda/bloc/bloc.dart';

void main() {
  group('EncomendaEvent', () {
    group('CustomEncomendaEvent', () {
      test('supports value equality', () {
        expect(
          EncomendarEvent(),
          equals(const EncomendarEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const EncomendarEvent(),
          isNotNull,
        );
      });
    });
  });
}
