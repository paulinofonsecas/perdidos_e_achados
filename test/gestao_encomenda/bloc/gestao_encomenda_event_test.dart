// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/bloc/bloc.dart';

void main() {
  group('GestaoEncomendaEvent', () {
    group('CustomGestaoEncomendaEvent', () {
      test('supports value equality', () {
        expect(
          GestaoEncomendaGetAllEvent.GestaoEncomendaGetAllEvent(),
          equals(const GestaoEncomendaGetAllEvent.GestaoEncomendaGetAllEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const GestaoEncomendaGetAllEvent.GestaoEncomendaGetAllEvent(),
          isNotNull,
        );
      });
    });
  });
}
