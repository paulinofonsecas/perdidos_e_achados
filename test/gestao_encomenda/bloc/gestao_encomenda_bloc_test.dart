// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/bloc/bloc.dart';

void main() {
  group('GestaoEncomendaBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          GestaoEncomendaBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final gestaoEncomendaBloc = GestaoEncomendaBloc();
      expect(gestaoEncomendaBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<GestaoEncomendaBloc, GestaoEncomendaState>(
      'CustomGestaoEncomendaEvent emits nothing',
      build: GestaoEncomendaBloc.new,
      act: (bloc) => bloc
          .add(const CustomGestaoEncomendaEvent.GestaoEncomendaGetAllEvent()),
      expect: () => <GestaoEncomendaState>[],
    );
  });
}
