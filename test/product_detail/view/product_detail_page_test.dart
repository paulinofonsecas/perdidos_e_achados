// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gestao_restaurante/global/product_detail/product_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductDetailPage', () {
    group('route', () {
      test('is routable', () {
        expect(ProductDetailPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ProductDetailView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ProductDetailPage()));
      expect(find.byType(ProductDetailView), findsOneWidget);
    });
  });
}
