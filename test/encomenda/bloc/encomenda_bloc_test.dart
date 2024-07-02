// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/features/client/encomenda/bloc/bloc.dart';

void main() {
  group('EncomendaBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          EncomendaBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final encomendaBloc = EncomendaBloc();
      expect(encomendaBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<EncomendaBloc, EncomendaState>(
      'CustomEncomendaEvent emits nothing',
      build: EncomendaBloc.new,
      act: (bloc) => bloc.add(const EncomendarEvent()),
      expect: () => <EncomendaState>[],
    );
  });
}
