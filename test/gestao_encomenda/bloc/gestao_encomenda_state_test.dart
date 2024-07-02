// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/features/client/gestao_encomenda/bloc/bloc.dart';

void main() {
  group('GestaoEncomendaState', () {
    test('supports value equality', () {
      expect(
        GestaoEncomendaState(),
        equals(
          const GestaoEncomendaState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const GestaoEncomendaState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const gestaoEncomendaState = GestaoEncomendaState(
            customProperty: 'My property',
          );
          expect(
            gestaoEncomendaState.copyWith(),
            equals(gestaoEncomendaState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const gestaoEncomendaState = GestaoEncomendaState(
            customProperty: 'My property',
          );
          final otherGestaoEncomendaState = GestaoEncomendaState(
            customProperty: 'My property 2',
          );
          expect(gestaoEncomendaState, isNot(equals(otherGestaoEncomendaState)));

          expect(
            gestaoEncomendaState.copyWith(
              customProperty: otherGestaoEncomendaState.customProperty,
            ),
            equals(otherGestaoEncomendaState),
          );
        },
      );
    });
  });
}
