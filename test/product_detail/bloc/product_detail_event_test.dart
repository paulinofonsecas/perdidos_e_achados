// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/global/product_detail/bloc/bloc.dart';

void main() {
  group('ProductDetailEvent', () {  
    group('CustomProductDetailEvent', () {
      test('supports value equality', () {
        expect(
          CustomProductDetailEvent(),
          equals(const CustomProductDetailEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomProductDetailEvent(),
          isNotNull
        );
      });
    });
  });
}
