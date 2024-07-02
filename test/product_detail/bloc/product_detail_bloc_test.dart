// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestao_restaurante/global/product_detail/bloc/bloc.dart';

void main() {
  group('ProductDetailBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ProductDetailBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final productDetailBloc = ProductDetailBloc();
      expect(productDetailBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ProductDetailBloc, ProductDetailState>(
      'CustomProductDetailEvent emits nothing',
      build: ProductDetailBloc.new,
      act: (bloc) => bloc.add(const CustomProductDetailEvent()),
      expect: () => <ProductDetailState>[],
    );
  });
}
