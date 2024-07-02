// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/global/product_detail/bloc/bloc.dart';

void main() {
  group('ProductDetailState', () {
    test('supports value equality', () {
      expect(
        ProductDetailState(),
        equals(
          const ProductDetailState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ProductDetailState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const productDetailState = ProductDetailState(
            customProperty: 'My property',
          );
          expect(
            productDetailState.copyWith(),
            equals(productDetailState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const productDetailState = ProductDetailState(
            customProperty: 'My property',
          );
          final otherProductDetailState = ProductDetailState(
            customProperty: 'My property 2',
          );
          expect(productDetailState, isNot(equals(otherProductDetailState)));

          expect(
            productDetailState.copyWith(
              customProperty: otherProductDetailState.customProperty,
            ),
            equals(otherProductDetailState),
          );
        },
      );
    });
  });
}
