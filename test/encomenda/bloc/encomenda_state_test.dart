// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/features/client/encomenda/bloc/bloc.dart';

void main() {
  group('EncomendaState', () {
    test('supports value equality', () {
      expect(
        EncomendaState(),
        equals(
          const EncomendaState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const EncomendaState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const encomendaState = EncomendaState(
            customProperty: 'My property',
          );
          expect(
            encomendaState.copyWith(),
            equals(encomendaState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const encomendaState = EncomendaState(
            customProperty: 'My property',
          );
          final otherEncomendaState = EncomendaState(
            customProperty: 'My property 2',
          );
          expect(encomendaState, isNot(equals(otherEncomendaState)));

          expect(
            encomendaState.copyWith(
              customProperty: otherEncomendaState.customProperty,
            ),
            equals(otherEncomendaState),
          );
        },
      );
    });
  });
}
